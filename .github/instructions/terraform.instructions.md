---
applyTo: "**/*.tf"
---

# Terraform Files Instructions - eng-gcp-governance

## GCP-Specific Resources

### Custom IAM Roles

```hcl
resource "google_organization_iam_custom_role" "<name>" {
  role_id     = "pagopa_<domain>_<purpose>"
  org_id      = var.organization_id
  title       = "<Human Readable Title>"
  description = "<Clear description of purpose>"
  permissions = [
    # List only necessary permissions - least privilege
  ]
}
```

### Organization Policies

```hcl
resource "google_org_policy_policy" "<policy_name>" {
  name   = "folders/${var.folder_id}/policies/<constraint.name>"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false  # ALWAYS specify explicitly

    rules {
      enforce = "TRUE"  # or "FALSE"
    }
  }
}
```

## Provider Configuration

```hcl
terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.28.0"  # Pin to specific version
    }
  }

  backend "gcs" {}
}

provider "google" {
  project               = var.project_id
  billing_project       = var.project_id
  user_project_override = true
  region                = var.region
  zone                  = var.zone
}
```

## Naming Conventions

| Resource Type | Pattern | Example |
|--------------|---------|---------|
| Custom Role | `pagopa_<domain>_<purpose>` | `pagopa_mailsage_user` |
| Policy Resource | `<service>_<constraint>` | `storage_publicAccessPrevention` |
| Policy File | `01_<service>_<constraint>.tf` | `01_storage_publicAccessPrevention.tf` |
| Variables | `snake_case` | `folder_id_prod` |

## File Organization

- `00_main.tf` - Provider and backend configuration
- `01_*.tf` - Primary resources
- `02_*.tf` - Environment-specific resources
- `03_*.tf` - Custom resources
- `99_variables.tf` - Input variables
- `99_outputs.tf` - Output values

## Best Practices

1. **One resource per file** for policies and roles
2. **Use variables** for all IDs (organization, folder, project)
3. **Pin provider version** to avoid breaking changes
4. **Explicit inheritance** - always set `inherit_from_parent`
5. **Run `terraform fmt`** before committing
6. **Add descriptions** to all variables and resources

## Common Constraints

| Constraint | Purpose |
|-----------|---------|
| `compute.skipDefaultNetworkCreation` | Prevent default VPC |
| `storage.publicAccessPrevention` | Block public buckets |
| `iam.managed.disableServiceAccountKeyCreation` | No SA keys |
| `iam.managed.disableServiceAccountKeyUpload` | No key uploads |
| `gcp.resourceLocations` | Restrict regions |

## Forbidden Patterns

```hcl
# ❌ WRONG - Hardcoded folder ID
parent = "folders/47551051631"

# ✅ CORRECT - Use variable
parent = "folders/${var.folder_id}"

# ❌ WRONG - Missing inherit_from_parent
spec {
  rules {
    enforce = "TRUE"
  }
}

# ✅ CORRECT - Explicit inheritance
spec {
  inherit_from_parent = false
  rules {
    enforce = "TRUE"
  }
}
```
