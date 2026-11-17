#!/usr/bin/env python3
"""Send one ASCE JSON request to an OpenAI-compatible chat-completions API."""

from __future__ import annotations

import argparse
import json
import os
import sys
from pathlib import Path
from typing import Any
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


ALLOWED_REQUEST_KEYS = {"messages", "response_format"}
RESERVED_EXTRA_KEYS = {"model", "messages", "response_format"}
FORBIDDEN_METADATA_KEYS = {
    "gold",
    "gold_answer",
    "oracle",
    "oracle_result",
    "mechanism",
    "targeted_mechanism",
    "task_id",
    "base_task_id",
    "variant_role",
    "property_key",
    "structural_family_id",
    "analysis_role",
}


def unique_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def reject_non_finite(value: str) -> None:
    raise ValueError(f"non-finite JSON constant: {value}")


def load_object(path: Path, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            path.read_text(encoding="utf-8"),
            object_pairs_hook=unique_object,
            parse_constant=reject_non_finite,
        )
    except (OSError, json.JSONDecodeError, ValueError) as error:
        raise ValueError(f"cannot read {label} JSON from {path}: {error}") from error
    if not isinstance(value, dict):
        raise ValueError(f"{label} must be a JSON object")
    return value


def validate_prompt(payload: dict[str, Any]) -> None:
    unexpected = set(payload) - ALLOWED_REQUEST_KEYS
    if unexpected:
        raise ValueError(f"prompt has unexpected top-level fields: {sorted(unexpected)}")
    messages = payload.get("messages")
    if not isinstance(messages, list) or not messages:
        raise ValueError("prompt must contain a non-empty messages array")
    for index, message in enumerate(messages):
        if not isinstance(message, dict) or set(message) != {"role", "content"}:
            raise ValueError(f"message {index} must contain exactly role and content")
        if not isinstance(message["role"], str) or not isinstance(message["content"], str):
            raise ValueError(f"message {index} role and content must be strings")
    if "response_format" in payload and not isinstance(payload["response_format"], dict):
        raise ValueError("response_format must be an object when present")


def find_forbidden_metadata(value: Any, path: str = "$") -> list[str]:
    if isinstance(value, dict):
        hits: list[str] = []
        for key, child in value.items():
            child_path = f"{path}.{key}"
            if key.lower() in FORBIDDEN_METADATA_KEYS:
                hits.append(child_path)
            hits.extend(find_forbidden_metadata(child, child_path))
        return hits
    if isinstance(value, list):
        return [
            hit
            for index, child in enumerate(value)
            for hit in find_forbidden_metadata(child, f"{path}[{index}]")
        ]
    return []


def endpoint_for(base_url: str) -> str:
    base = base_url.rstrip("/")
    if not base.startswith(("https://", "http://")):
        raise ValueError("base URL must begin with http:// or https://")
    suffix = "/chat/completions"
    return base if base.endswith(suffix) else base + suffix


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Send one stored ASCE prompt without adding benchmark metadata."
    )
    parser.add_argument("--prompt", type=Path, required=True, help="path to a .request.json file")
    parser.add_argument("--model", required=True, help="provider model identifier")
    parser.add_argument(
        "--base-url",
        default="https://api.openai.com/v1",
        help="OpenAI-compatible API base URL or full /chat/completions endpoint",
    )
    parser.add_argument(
        "--api-key-env",
        default="OPENAI_API_KEY",
        help="environment variable containing the API key",
    )
    parser.add_argument(
        "--extra-body",
        type=Path,
        help="optional JSON object of provider/model options, excluding model and prompt fields",
    )
    parser.add_argument("--timeout", type=float, default=120.0, help="HTTP timeout in seconds")
    parser.add_argument("--output", type=Path, help="write the raw API response to this new file")
    parser.add_argument(
        "--overwrite-output",
        action="store_true",
        help="allow --output to replace an existing file",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_arguments()
    if not args.model.strip():
        raise ValueError("model must not be empty")
    if not args.api_key_env.strip():
        raise ValueError("api-key environment variable name must not be empty")
    if args.timeout <= 0:
        raise ValueError("timeout must be positive")

    prompt = load_object(args.prompt, "prompt")
    validate_prompt(prompt)
    body = {"model": args.model, **prompt}

    if args.extra_body is not None:
        extra = load_object(args.extra_body, "extra-body")
        reserved = set(extra) & RESERVED_EXTRA_KEYS
        if reserved:
            raise ValueError(f"extra-body cannot override prompt fields: {sorted(reserved)}")
        forbidden = find_forbidden_metadata(extra)
        if forbidden:
            raise ValueError(f"extra-body contains benchmark metadata fields: {forbidden}")
        body.update(extra)

    api_key = os.environ.get(args.api_key_env)
    if not api_key:
        raise ValueError(f"required environment variable is unset: {args.api_key_env}")

    request_body = json.dumps(body, ensure_ascii=False, separators=(",", ":")).encode("utf-8")
    request = Request(
        endpoint_for(args.base_url),
        data=request_body,
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        method="POST",
    )

    try:
        with urlopen(request, timeout=args.timeout) as response:
            response_body = response.read()
    except HTTPError as error:
        detail = error.read().decode("utf-8", errors="replace")
        print(f"API returned HTTP {error.code}: {detail}", file=sys.stderr)
        return 2
    except URLError as error:
        print(f"API transport error: {error.reason}", file=sys.stderr)
        return 3

    try:
        json.loads(response_body, object_pairs_hook=unique_object, parse_constant=reject_non_finite)
    except (json.JSONDecodeError, ValueError) as error:
        print(f"API returned invalid JSON: {error}", file=sys.stderr)
        return 4

    if args.output is None:
        sys.stdout.buffer.write(response_body)
        if not response_body.endswith(b"\n"):
            sys.stdout.buffer.write(b"\n")
        return 0

    args.output.parent.mkdir(parents=True, exist_ok=True)
    if args.output.exists() and not args.overwrite_output:
        raise ValueError(f"output already exists: {args.output}; use --overwrite-output to replace it")
    args.output.write_bytes(response_body)
    print(args.output)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except ValueError as error:
        print(f"error: {error}", file=sys.stderr)
        raise SystemExit(1) from error
