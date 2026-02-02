---
agent: agent
description: Create a new GCP custom IAM role
---

# Create New Custom IAM Role

## Context

Create a new custom IAM role in GCP at the organization level. Custom roles follow the least privilege principle, granting only the specific permissions needed for a particular use case.

## Required Inputs

- **Role Name**: ${input:role_name} (e.g., `mailsage_user`, `dataflow_operator`)
- **Domain/Project**: ${input:domain} (e.g., `mailsage`, `analytics`, `platform`)
- **Role Title**: ${input:role_title} (Human-readable name)
- **Role Description**: ${input:role_description}
- **Permissions**: ${input:permissions} (Comma-separated list of GCP permissions)

## Instructions

### 1. Create the Role File

Create a new file in `src/01_custom_roles/` named `02_<domain>_<role_name>.tf`:

```hcl
resource "google_organization_iam_custom_role" "pagopa_<domain>_<role_name>" {
  role_id     = "pagopa_<domain>_<role_name>"
  org_id      = var.organization_id
  title       = "<Role Title>"
  description = "<Role Description>"
  permissions = [
    "<permission1>",
    "<permission2>",
    # Add only necessary permissions
  ]
}
```

### 2. Naming Convention

- **role_id**: `pagopa_<domain>_<purpose>` (lowercase, underscores)
- **File name**: `02_<domain>_<purpose>.tf`
- **Resource name**: Match the role_id

### 3. Permission Guidelines

- Use **minimum required permissions** only
- Check [GCP IAM permissions reference](https://cloud.google.com/iam/docs/permissions-reference)
- Avoid wildcard permissions
- Group related permissions logically

## Example

For a role that allows users to make predictions with AI Platform:

```hcl
resource "google_organization_iam_custom_role" "pagopa_mailsage_user" {
  role_id     = "pagopa_mailsage_user"
  org_id      = var.organization_id
  title       = "PagoPA MailSage User Role"
  description = "User role used by MailSage project"
  permissions = ["aiplatform.endpoints.predict"]
}
```

## Validations

- [ ] Role ID follows `pagopa_<domain>_<purpose>` pattern
- [ ] Uses `var.organization_id` not hardcoded
- [ ] Title is human-readable
- [ ] Description explains the role's purpose
- [ ] Permissions are valid GCP permissions
- [ ] Permissions follow least privilege principle
- [ ] File is in `src/01_custom_roles/` directory

## References

Follow the conventions in `#file:.github/copilot-instructions.md`

See existing roles in `#file:src/01_custom_roles/` for examples.

## Common Permission Patterns

| Use Case | Typical Permissions |
|----------|---------------------|
| AI/ML Inference | `aiplatform.endpoints.predict` |
| BigQuery Reader | `bigquery.tables.getData`, `bigquery.jobs.create` |
| Storage Viewer | `storage.objects.get`, `storage.objects.list` |
| Pub/Sub Publisher | `pubsub.topics.publish` |
| Cloud Run Invoker | `run.routes.invoke` |
