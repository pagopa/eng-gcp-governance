---
description: Create or extend a custom GCP IAM role in the governance custom-roles stack.
name: internal-add-custom-role
agent: agent
argument-hint: role_name=<name> domain=<domain> role_title=<title> role_description=<text> permissions=<comma-separated>
---

# Internal GCP Custom Role Task

## Instructions
1. Use `.github/skills/internal-cloud-policy/SKILL.md`.
2. Create or update a file under `src/01_custom_roles/`, following the repository pattern `02_<domain>_<role_name>.tf`.
3. Match the current role structure:
   - `resource "google_organization_iam_custom_role" "pagopa_<domain>_<role_name>"`;
   - `role_id = "pagopa_<domain>_<role_name>"`;
   - `org_id = var.organization_id`;
   - explicit `permissions = [...]`.
4. Keep permissions least-privilege and avoid wildcard grants.
5. Reuse the same naming and file layout already used by `src/01_custom_roles/02_mailsage_user.tf`.
6. Do not hardcode the organization ID in the resource body; keep `var.organization_id`.
7. Keep one custom role per file unless the repository already groups a tightly related set of roles in the same file.

## Minimal example
- Input: `role_name=mailsage_user domain=mailsage role_title="PagoPA MailSage User Role" role_description="User role used by MailSage project" permissions=aiplatform.endpoints.predict`
- Expected output:
  - A file under `src/01_custom_roles/` following the `02_<domain>_<role_name>.tf` convention.
  - The resource uses `var.organization_id`.
  - Permissions are explicitly listed and limited to the requested capability.

## Validation
- Run `terraform fmt -check` in `src/01_custom_roles`.
- Run `terraform validate` in `src/01_custom_roles`.
- Verify the role ID, resource name, and filename all follow the same `<domain>_<role_name>` pattern.
