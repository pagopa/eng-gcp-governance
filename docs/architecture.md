# AI Architecture Contract v1.1.0

## Repository

`eng-gcp-governance` manages GCP governance infrastructure, including custom IAM roles, custom policy definitions, and organization policy assignments.

## Purpose

The repository is a GCP governance policy-as-code repository. It separates custom roles, policy definitions, and policy assignments into Terraform roots with simple workflow validation.

## System Boundaries

In scope:

- Custom roles under `src/01_custom_roles/`.
- Custom policies under `src/02_policy_custom/`.
- Policy assignments under `src/03_policy_assignments/`.
- Module-based policy assignment structure under `src/03_policy_assignments/modules/`.
- Terraform wrappers for each root.
- Pre-commit workflow validation.

Out of scope:

- GCP project and group authorization, which belongs to `eng-gcp-authorization`.
- GCP application workload deployment.
- Cross-cloud governance normalization.

## Main Components

| Component | Path | Responsibility |
| --- | --- | --- |
| Custom roles | `src/01_custom_roles/` | GCP organization custom role definitions. |
| Custom policies | `src/02_policy_custom/` | Custom policy definitions and policy-related Terraform. |
| Policy assignments | `src/03_policy_assignments/` | Assignment roots and modules for environments or folders. |
| Assignment modules | `src/03_policy_assignments/modules/` | Reusable assignment structure. |
| Workflow automation | `.github/workflows/_pre-commit.yml` | Repository pre-commit validation. |

## Architecture Flow

```text
Custom roles and policy definitions
  -> policy assignment modules
  -> Terraform wrappers
  -> pre-commit validation
  -> GCP organization governance state
```

The architecture is compact and policy-layered. Roles, policy definitions, and assignments should remain separated unless a change explicitly requires coordinated updates.

## Validation Surface

Observed validation surfaces include:

- Workflow `_pre-commit.yml`.
- Terraform wrapper scripts under `src/01_custom_roles/`, `src/02_policy_custom/`, and `src/03_policy_assignments/`.
- `CONTRIBUTING.md` and `SECURITY.md`.

No repository-root `tests/` files or `Makefile` targets were observed in the current workspace structure.

## Operational Notes

- Keep custom roles least-privilege and explicit.
- Keep policy definitions and assignments separate for reviewability.
- Preserve module structure under `src/03_policy_assignments/modules/`.
- Validate Terraform roots before merging governance changes.

## Risks And Open Questions

| Risk | Current evidence | Recommended handling |
| --- | --- | --- |
| Limited validation surface | Only `_pre-commit.yml` and wrappers observed. | Add tests or explicit Terraform validation documentation when policy complexity grows. |
| Role and policy changes can affect organization-wide behavior | Custom roles and policy assignment roots exist. | Require least-privilege review and scoped plan output for policy changes. |
| Module assignment ownership may be implicit | Modules exist under assignments. | Document module ownership and folder/environment mapping when adding assignments. |

## Contract Status

This repository is ready for AI Architecture Contract v1.1.0 as a compact GCP governance policy-as-code repository.
