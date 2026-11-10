# ASCE Benchmark

**ASCE (Acausal Semantic Contrastive Evaluation)** is a specification-grounded benchmark for evaluating large language models' (LLMs) understanding of selected static semantics of the Modelica language.

The benchmark focuses on semantic reasoning and contrastive evaluation, examining whether LLMs can correctly interpret Modelica programs and distinguish between semantics-preserving and semantics-changing transformations.

## Benchmark Overview

ASCE evaluates three main families of Modelica semantics:

- **Connection Semantics:** Connection-set membership, potential equalities, and signed flow-balance constraints.
- **Affine Equation Semantics:** Exact-value computation, logical entailment, and consistency of affine equation systems.
- **Hierarchical Elaboration:** Parameter bindings, component modifications, inheritance, and nested scopes.

The benchmark also includes cross-mechanism tasks that require reasoning across multiple semantic families.

## Benchmark Composition

ASCE contains **593 unique tasks**, organized into seven evaluation collections:

| Collection | Tasks |
|---|---:|
| Atomic and Compositional Coverage | 329 |
| Structural Transfer | 72 |
| Focused Semantic Extension | 72 |
| Mechanism Probes | 18 |
| Signed-Flow Diagnostics | 36 |
| Structured Scope Diagnostics | 18 |
| Specification-Boundary Diagnostics (D1–D16) | 48 |
| **Total** | **593** |

The benchmark incorporates **183 Base–Preserve–Change triplets** to examine whether model predictions remain stable under property-preserving transformations and respond appropriately to property-changing transformations.

The Specification-Boundary Diagnostics provide targeted evaluation of 16 Modelica semantic dimensions.

## Evaluation Conditions

ASCE supports multiple information conditions:

- **Unassisted:** Modelica source code and the semantic question.
- **Z1 — Rule Guidance:** Additional relevant Modelica specification rules.
- **Z2 — Compiler Metadata:** Limited compiler-provided metadata.
- **Z3 — Compiler Connection Equations:** Compiler-provided connection equations for selected cross-mechanism tasks.
