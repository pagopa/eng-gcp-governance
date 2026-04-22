---
description: Create a new GCP organization policy assignment in the correct environment module.
name: internal-add-policy-assignment
agent: agent
argument-hint: constraint_name=<name> environment=<pagopa|dev|uat|prod|custom> enforcement=<TRUE|FALSE> inherit=<true|false>
---

# Internal GCP Policy Assignment Task

## Instructions
1. Use `.github/skills/internal-cloud-policy/SKILL.md`.
2. Create or update the policy file under `src/03_policy_assignments/modules/${input:environment}/`.
3. Follow the repository's existing file naming and resource pattern:
   - file name `01_<service>_<constraint>.tf`;
   - `resource "google_org_policy_policy" ...`;
   - `name = "folders/${var.folder_id}/policies/<constraint>"`;
   - `parent = "folders/${var.folder_id}"`;
   - explicit `inherit_from_parent = <true|false>`.
4. Reuse the same module structure already used by files such as `modules/pagopa/01_storage_publicAccessPrevention.tf` and `modules/custom/01_gcp_resourceLocations.tf`.
5. If the constraint needs list values or conditions instead of simple enforcement, mirror the closest sibling policy that already uses that structure.
6. Keep the target environment limited to the existing module set unless a separate environment module is being created through the dedicated environment task.
7. Do not hardcode folder IDs inside policy resources.

## Minimal example
- Input: `constraint_name=storage.publicAccessPrevention environment=pagopa enforcement=TRUE inherit=false`
- Expected output:
  - A new or updated file under `src/03_policy_assignments/modules/pagopa/`.
  - The resource uses `var.folder_id`.
  - `inherit_from_parent` is explicitly set.

## Validation
- Run `terraform fmt -check` in `src/03_policy_assignments`.
- Run `terraform validate` in `src/03_policy_assignments`.
- Verify the constraint path, filename, and resource name all stay consistent with the module's current naming style.
