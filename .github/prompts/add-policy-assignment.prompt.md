---
agent: agent
description: Create a new GCP Organization Policy assignment
---

# Create New Organization Policy Assignment

## Context

Create a new GCP Organization Policy assignment in this repository. Organization policies enforce constraints on GCP resources at the folder or organization level.

## Required Inputs

- **Constraint Name**: ${input:constraint_name} (e.g., `storage.publicAccessPrevention`, `compute.skipDefaultNetworkCreation`)
- **Target Environment**: ${input:environment:pagopa,dev,uat,prod,custom}
- **Enforcement**: ${input:enforcement:TRUE,FALSE}
- **Inherit from Parent**: ${input:inherit:true,false}

## Instructions

### 1. Identify the Correct Module

Based on the target environment, create the file in:
- `pagopa` → `src/03_policy_assignments/modules/pagopa/`
- `dev` → `src/03_policy_assignments/modules/dev/`
- `uat` → `src/03_policy_assignments/modules/uat/`
- `prod` → `src/03_policy_assignments/modules/prod/`
- `custom` → `src/03_policy_assignments/modules/custom/`

### 2. Create the Policy File

Create a new file named `01_<service>_<constraintName>.tf`:

```hcl
resource "google_org_policy_policy" "<service>_<constraintName>" {
  name   = "folders/${var.folder_id}/policies/<constraint.name>"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = <inherit_value>

    rules {
      enforce = "<ENFORCEMENT>"
    }
  }
}
```

### 3. File Naming

Extract the service and constraint from the full constraint name:
- `storage.publicAccessPrevention` → `01_storage_publicAccessPrevention.tf`
- `compute.skipDefaultNetworkCreation` → `01_compute_skipDefaultNetworkCreation.tf`
- `iam.managed.disableServiceAccountKeyCreation` → `01_iam_managed_disableServiceAccountKeyCreation.tf`

### 4. Verify Module Variables

Ensure the target module has `folder_id` variable in its `99_variables.tf`:

```hcl
variable "folder_id" {
  description = "The folder ID to apply policies to"
  type        = string
}
```

## Validations

- [ ] Constraint name is a valid GCP organization policy constraint
- [ ] File is created in the correct module folder
- [ ] `inherit_from_parent` is explicitly set
- [ ] Resource name follows naming convention
- [ ] Uses `var.folder_id` not hardcoded ID

## References

Follow the conventions in `#file:.github/copilot-instructions.md`

See existing policies in `#file:src/03_policy_assignments/modules/pagopa/` for examples.

## Common Constraints

| Constraint | Service | Purpose |
|-----------|---------|---------|
| `compute.skipDefaultNetworkCreation` | compute | Prevent default VPC creation |
| `storage.publicAccessPrevention` | storage | Block public bucket access |
| `iam.managed.disableServiceAccountKeyCreation` | iam | Prevent SA key creation |
| `iam.managed.disableServiceAccountKeyUpload` | iam | Prevent SA key upload |
| `gcp.resourceLocations` | gcp | Restrict allowed regions |
| `compute.vmExternalIpAccess` | compute | Control external IPs |
| `sql.restrictPublicIp` | sql | Block public SQL instances |
