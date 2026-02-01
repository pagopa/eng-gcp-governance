# Copilot Instructions - eng-gcp-governance

## 🎯 Repository Purpose

This repository manages **GCP Organization Policies** and **Custom IAM Roles** for PagoPA's Google Cloud infrastructure. It applies governance guardrails for security and compliance across all GCP projects and folders using Terraform.

## 📁 Project Structure

```
eng-gcp-governance/
├── src/
│   ├── 01_custom_roles/           # Custom IAM roles with least privilege
│   │   ├── 00_main.tf             # Provider and backend configuration
│   │   ├── 02_*.tf                # Custom role definitions
│   │   ├── variables.tf           # Variables for custom roles
│   │   └── terraform.sh           # Terraform execution script
│   │
│   ├── 02_policy_custom/          # Custom Organization Policy definitions
│   │   ├── 00_main.tf             # Provider and backend configuration
│   │   ├── 02_policy_*.tf         # Policy constraint definitions
│   │   ├── variables.tf           # Variables for policies
│   │   └── terraform.sh           # Terraform execution script
│   │
│   └── 03_policy_assignments/     # Policy assignments to folders/projects
│       ├── 00_main.tf             # Provider and backend configuration
│       ├── 01_pagopa.tf           # Organization-level assignments
│       ├── 02_dev.tf              # Dev folder assignments
│       ├── 02_uat.tf              # UAT folder assignments
│       ├── 02_prod.tf             # Prod folder assignments
│       ├── 03_custom.tf           # Custom assignments
│       ├── 99_variables.tf        # Variables
│       ├── 99_outputs.tf          # Outputs
│       └── modules/               # Assignment modules by folder
│           ├── pagopa/            # Organization-wide policies
│           ├── dev/               # Development environment
│           ├── uat/               # UAT environment
│           ├── prod/              # Production environment
│           └── custom/            # Custom policies
│
├── .github/                       # GitHub configuration
├── .editorconfig                  # Editor configuration
├── .pre-commit-config.yaml        # Pre-commit hooks
├── README.md                      # Project documentation
└── CODEOWNERS                     # Code ownership
```

## 📋 Main File Schemas

### Custom IAM Role

```hcl
resource "google_organization_iam_custom_role" "<role_name>" {
  role_id     = "<role_id>"                    # Unique role identifier
  org_id      = var.organization_id            # Organization ID
  title       = "<Role Display Name>"          # Human-readable title
  description = "<Role description>"           # Purpose of the role
  permissions = [                              # Least privilege permissions
    "permission.action1",
    "permission.action2"
  ]
}
```

### Organization Policy

```hcl
resource "google_org_policy_policy" "<policy_name>" {
  name   = "folders/${var.folder_id}/policies/<constraint_name>"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      enforce = "TRUE"  # or "FALSE"
      # For list constraints:
      # values {
      #   allowed_values = ["value1", "value2"]
      #   denied_values  = ["value3"]
      # }
    }
  }
}
```

## ✅ Mandatory Conventions

### Naming

- **Custom roles**: `pagopa_<domain>_<purpose>` (e.g., `pagopa_mailsage_user`)
- **Policy files**: `01_<service>_<constraint>.tf` (e.g., `01_storage_publicAccessPrevention.tf`)
- **Variables**: `snake_case` with descriptive names
- **Modules**: Named by folder/environment (e.g., `pagopa`, `dev`, `uat`, `prod`)

### File Organization

1. **Numbering prefix** for execution order:
   - `00_` - Provider/backend configuration
   - `01_` - Core resources
   - `02_` - Environment-specific resources
   - `03_` - Custom/additional resources
   - `99_` - Variables and outputs

2. **One resource per file** for policies and roles
3. **Module per environment** for assignments

### Terraform

1. **Provider version**: Pin to specific version (currently `6.28.0`)
2. **Backend**: GCS bucket `tfapporg-terraform-state`
3. **Region**: Default `europe-west8` (Milan)
4. **Required version**: `>= 1.7.0`

### Code Style

1. **Early Return**: Use early return patterns where possible
2. **Descriptive comments**: Explain the "why" for each policy
3. **Simple code**: Prioritize readability
4. **Consistent formatting**: Use `terraform fmt`

## 🚫 What NOT to Do

1. ❌ **DO NOT** create overly permissive roles - always apply least privilege
2. ❌ **DO NOT** disable organization policies without security approval
3. ❌ **DO NOT** hardcode folder/project IDs - use variables
4. ❌ **DO NOT** skip `inherit_from_parent` specification in policies
5. ❌ **DO NOT** create roles at project level - use organization level
6. ❌ **DO NOT** use deprecated policy resources (use `google_org_policy_policy`)
7. ❌ **DO NOT** commit `.terraform/` directories or state files
8. ❌ **DO NOT** modify backend configuration without coordination

## 🎯 Design Principles

- **Least Privilege**: Roles have minimum required permissions
- **Defense in Depth**: Multiple policy layers for security
- **Environment Isolation**: Separate policies per environment (dev/uat/prod)
- **Idempotency**: All operations are repeatable
- **Inheritance Control**: Explicit `inherit_from_parent` settings
- **Centralized Governance**: All policies managed from this repository

## 👥 Target Users

- **Cloud Platform Team**: Define and manage GCP governance
- **Security Team**: Review and approve policy changes
- **Development Teams**: Understand constraints applied to their projects

## 🔄 Preferred Workflow

1. Create feature branch from `main`
2. Add/modify Terraform configurations
3. Run `terraform fmt` and validate
4. Run pre-commit hooks (`terraform_fmt`, `terraform_docs`, `terraform_trivy`, `terraform_validate`)
5. Create PR with detailed description
6. Get security review for policy changes
7. Apply via `./terraform.sh plan|apply`

## 🔐 GCP Organization Context

- **Organization ID**: `520838205140`
- **Customer ID**: `C00siwdxu`
- **Domain**: `pagopa.it`
- **Primary Region**: `europe-west8` (Milan)
- **State Bucket**: `tfapporg-terraform-state`

### Folder Structure

| Folder | ID | Purpose |
|--------|-----|---------|
| pagopa | `47551051631` | Organization root |
| dev | `286367851296` | Development environment |
| uat | `794602495691` | UAT environment |
| prod | `797731740140` | Production environment |

## 📚 References

- [GCP Organization Policy Docs](https://cloud.google.com/resource-manager/docs/organization-policy/creating-managing-policies)
- [GCP IAM Custom Roles](https://cloud.google.com/iam/docs/creating-custom-roles)
- [Terraform Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
