# GCP Governance Rules

<!-- markdownlint-disable MD013 -->

These rules apply to contributors changing GCP governance definitions and assignments in this repository.

## GCP-GOV-001 - Apply policy layers in order

- Rule ID: GCP-GOV-001
- Owner: GCP governance context
- Severity: blocking
- Enforcement owner: not enforced
- Evidence: [CONTRIBUTING.md](../../../CONTRIBUTING.md)
- Remediation: Review custom roles first, policy definitions second, and policy assignments last.
- Rule: Apply changes in `01_custom_roles`, then `02_policy_custom`, then `03_policy_assignments`.

## GCP-GOV-002 - Set policy inheritance explicitly

- Rule ID: GCP-GOV-002
- Owner: GCP governance context
- Severity: blocking
- Enforcement owner: not enforced
- Evidence: [CONTRIBUTING.md](../../../CONTRIBUTING.md), [src/03_policy_assignments/modules/pagopa/01_storage_publicAccessPrevention.tf](../../../src/03_policy_assignments/modules/pagopa/01_storage_publicAccessPrevention.tf)
- Remediation: Add an explicit `inherit_from_parent` value to each organization policy specification.
- Rule: Every policy assignment must set `inherit_from_parent` explicitly.

## GCP-GOV-003 - Use least privilege for custom roles

- Rule ID: GCP-GOV-003
- Owner: GCP governance context
- Severity: blocking
- Enforcement owner: not enforced
- Evidence: [CONTRIBUTING.md](../../../CONTRIBUTING.md), [SECURITY.md](../../../SECURITY.md)
- Remediation: Remove unnecessary permissions and document the justification for each retained permission.
- Rule: Custom IAM roles must follow least privilege and must not use wildcard permissions.

## GCP-GOV-004 - Protect sensitive state

- Rule ID: GCP-GOV-004
- Owner: GCP governance context
- Severity: blocking
- Enforcement owner: not enforced
- Evidence: [SECURITY.md](../../../SECURITY.md), [.gitignore](../../../.gitignore), [.pre-commit-config.yaml](../../../.pre-commit-config.yaml)
- Remediation: Remove committed state or credentials and rotate exposed secrets through the responsible platform process.
- Rule: Terraform state, credentials, tokens, and keys must not be committed to the repository.

## GCP-GOV-005 - Test policy changes before enforcement

- Rule ID: GCP-GOV-005
- Owner: GCP governance context
- Severity: warning
- Enforcement owner: not enforced
- Evidence: [SECURITY.md](../../../SECURITY.md)
- Remediation: Validate the change in a development target and review its impact before applying enforcement.
- Rule: Organization policy changes must be tested in development first and reviewed before enforcement.
