# Terraform File Naming Standards

Contributors use these conventions across the repository's Terraform roots and
assignment modules. They are documented practices, not automated rules.

## Ordered root files

- Convention: Prefix root files with `00_` for setup, `01_` or `02_` for
  definitions, and `99_` for variables or outputs.
- Evidence: [CONTRIBUTING.md](../../CONTRIBUTING.md),
  [src/01_custom_roles/](../../src/01_custom_roles/), and
  [src/03_policy_assignments/](../../src/03_policy_assignments/).
- Exceptions: `terraform.sh` and generated provider lock files are not ordered
  Terraform source files.

## Policy assignment files

- Convention: Name policy files `01_<service>_<constraint>.tf`.
- Evidence: [CONTRIBUTING.md](../../CONTRIBUTING.md) and
  [src/03_policy_assignments/modules/pagopa/](../../src/03_policy_assignments/modules/pagopa/).
- Exceptions: none evidenced.

## Custom role files

- Convention: Name custom role files `02_<domain>_<purpose>.tf` and use
  `pagopa_<domain>_<purpose>` for role identifiers.
- Evidence: [CONTRIBUTING.md](../../CONTRIBUTING.md) and
  [src/01_custom_roles/02_mailsage_user.tf](../../src/01_custom_roles/02_mailsage_user.tf).
- Exceptions: none evidenced.

## Not established yet

- No naming convention is evidenced for inactive Terraform source stored with a
  suffix such as `.tf.txt`. Preserve the current path until its lifecycle is
  decided.
- No automated check enforces these conventions. Review filenames against this
  standard and `CONTRIBUTING.md`.
