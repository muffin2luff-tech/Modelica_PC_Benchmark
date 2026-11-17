# API Request Example

`run_chat_completion.py` sends one stored ASCE JSON request to an
OpenAI-compatible `POST /chat/completions` endpoint. It is a small reference
client, not the benchmark scorer or the full experimental runner.

The script forwards the selected request JSON exactly as stored. It adds only
the provider model identifier and optional provider/model settings supplied in
an `--extra-body` file. It does not read the task manifest, Gold answers,
Oracle evidence, scores, or other questions.

## Requirements

- Python 3.10 or later; no third-party package is required.
- An API key stored in an environment variable.
- A provider that implements the OpenAI-compatible Chat Completions endpoint.

The script never writes the API key to its output. Review the data-use policy
of any endpoint before submitting a benchmark question.

## Send a Part 1 request

```bash
export OPENAI_API_KEY='replace-with-your-key'

python3 examples/run_chat_completion.py \
  --base-url https://api.openai.com/v1 \
  --api-key-env OPENAI_API_KEY \
  --model provider/model-name \
  --prompt benchmark_P1_545/prompts/C2-F1-01.request.json \
  --output responses/C2-F1-01.json
```

Part 1 requests include their stored JSON-schema response format. The client
forwards that field unchanged.

## Send a Part 2 request

```bash
python3 examples/run_chat_completion.py \
  --base-url https://api.openai.com/v1 \
  --api-key-env OPENAI_API_KEY \
  --model provider/model-name \
  --prompt benchmark_P2_48/prompts/Q018e251e9da1.request.json \
  --output responses/Q018e251e9da1.json
```

Part 2 requests deliberately retain their original text answer contracts and
therefore do not carry a JSON-schema response format.

## Optional provider settings

Place non-secret, provider-supported settings in a JSON file. The file cannot
override `model`, `messages`, or `response_format`.

```json
{
  "temperature": 0,
  "reasoning": {"enabled": true}
}
```

```bash
python3 examples/run_chat_completion.py \
  --base-url https://example.invalid/v1 \
  --api-key-env EXAMPLE_API_KEY \
  --model provider/model-name \
  --prompt benchmark_P1_545/prompts/C2-F1-01.request.json \
  --extra-body request-options.json \
  --output responses/C2-F1-01.json
```

Use `--overwrite-output` only when intentionally replacing a saved raw
response. The response file is raw provider JSON and can be scored using an
independent evaluator; this example performs no scoring or retries.
