# Copilot Instructions - eng-gcp-governance

## 🎯 Repository Purpose
Manages **GCP Organization Policies** and **Custom IAM Roles** for PagoPA, applying security guardrails across projects and folders.

## 📁 Key Project Structure
- `src/01_custom_roles/`: Custom IAM roles with least privilege (Organization-level).
- `src/02_policy_custom/`: Definitions of custom Organization Policy constraints.
- `src/03_policy_set/` (if exists) or assignments in `src/03_policy_assignments/`:
    - `01_pagopa.tf`: Org-level assignments.
    - `02_dev.tf`, `02_uat.tf`, `02_prod.tf`: Environment-specific assignments.

## 🛠️ Critical Workflows
1. **Add Role**: Create `google_organization_iam_custom_role` in `src/01_custom_roles/`.
2. **Assign Policy**: Update modules in `src/03_policy_assignments/modules/` or files in `src/03_policy_assignments/`.
3. **Execution**: Use `./terraform.sh plan|apply` from the target component folder.

## ✅ Mandatory Conventions
- **Naming**:
    - Roles: `pagopa_<domain>_<purpose>` (e.g., `pagopa_mailsage_user`).
    - Policies: `01_<service>_<constraint>.tf`.
- **Terraform**: Use GCS backend `tfapporg-terraform-state`, pin provider version (see `00_main.tf`), and use `google_org_policy_policy` resource.
- **Organization IDs**: PagoPA Root (`47551051631`), Dev (`286367851296`), Uat (`794602495691`), Prod (`797731740140`).
- **Logging**: Use emoji prefixes (✅ Success, ❌ Error, ⚠️ Warning, 🔍 Info, 🚀 Start).

## 🚫 What NOT to Do
- ❌ Disable organization policies without security approval.
- ❌ Hardcode folder or project IDs (use variables).
- ❌ Use deprecated policy resources (always use `google_org_policy_policy`).
- ❌ Create roles at project level (always use organization level).

## 📚 Reference
See `README.md` for specific folder IDs and resource hierarchy details.

