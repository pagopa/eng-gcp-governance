# Single GCP Governance Context

Status: accepted through the approved execution plan.

The repository records one knowledge domain, GCP governance, because its custom roles, policy definitions, and policy assignments share one purpose and vocabulary and are maintained as one Terraform policy-as-code repository. The separate numbered roots and assignment modules are physical components and state or lifecycle boundaries, not separate knowledge contexts. This proposal is supported by [AGENTS.local.md](../../AGENTS.local.md), [README.md](../../README.md), and [docs/architecture.md](../architecture.md).

## Considered Options

- Keep one context and document the policy layers as components.
- Split custom roles, policy definitions, and policy assignments into separate contexts.

The single-context layout is a deliberate bounded exception, not an
evidence-derived conclusion that the three promoted areas share one domain.
Custom Roles, Custom Policy Definitions, and Policy Assignments each have
distinct representation, state, delivery, independent execution, and
directional-order signals. The existing single context remains in place for
this wave because changing the ADR index or broader policy topology is out of
scope.
