---
agent: agent
description: Add a new environment folder for policy assignments
---

# Add New Environment Folder

## Context

Create a new environment module for policy assignments. Each environment (dev, uat, prod, etc.) has its own module under `src/03_policy_assignments/modules/` with folder-specific policy configurations.

## Required Inputs

- **Environment Name**: ${input:env_name} (e.g., `sandbox`, `staging`, `shared`)
- **Folder ID**: ${input:folder_id} (GCP Folder ID)
- **Folder Description**: ${input:folder_description}

## Instructions

### 1. Create the Module Directory

Create `src/03_policy_assignments/modules/<env_name>/`

### 2. Create Module Files

#### `00_main.tf`

```hcl
# Module: <env_name>
# Description: Policy assignments for <folder_description>
```

#### `99_variables.tf`

```hcl
variable "folder_id" {
  description = "The <env_name> folder ID to apply policies to"
  type        = string
}
```

#### `readme.md`

```markdown
# <Environment Name> Policy Assignments

Policy assignments for the <folder_description> folder.

## Folder ID

`<folder_id>`

## Policies

List of policies applied to this environment:

- (Add policies as they are created)
```

### 3. Add Variable in Main Variables

Add to `src/03_policy_assignments/99_variables.tf`:

```hcl
variable "folder_id_<env_name>" {
  description = "FolderID Google Cloud <Environment Name>"
  type        = string
  default     = "<folder_id>"  # <folder_description>
}
```

### 4. Create Module Call

Create `src/03_policy_assignments/02_<env_name>.tf`:

```hcl
module "<env_name>_assignments" {
  source = "./modules/<env_name>"

  folder_id = var.folder_id_<env_name>
}
```

### 5. Add Initial Policy (Optional)

Create at least one policy file to establish the pattern, e.g., `01_storage_publicAccessPrevention.tf`:

```hcl
resource "google_org_policy_policy" "storage_publicAccessPrevention" {
  name   = "folders/${var.folder_id}/policies/storage.publicAccessPrevention"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      enforce = "TRUE"
    }
  }
}
```

## Validations

- [ ] Module directory created under `modules/`
- [ ] `99_variables.tf` has `folder_id` variable
- [ ] Variable added to main `99_variables.tf`
- [ ] Module call created in `02_<env_name>.tf`
- [ ] README file created with folder information

## References

Follow the conventions in `#file:.github/copilot-instructions.md`

See existing modules in `#file:src/03_policy_assignments/modules/` for examples.
