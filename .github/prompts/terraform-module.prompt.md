```prompt
---
agent: agent
description: Modify or create Terraform modules for GCP governance
---

# Terraform Module

## Context

I need to modify or extend Terraform configuration for GCP governance (custom roles, policies, assignments).

## Codebase Discovery

Analyze existing files with `#codebase` and:
- `#file:src/01_custom_roles/`
- `#file:src/02_policy_custom/`
- `#file:src/03_policy_assignments/`

## Input Required

- **Modification type**: ${input:type:resource,variable,output,data_source,module}
- **Description**: ${input:description}

## Conventions

- Use `snake_case` for resources and variables
- Always add `description` to variables
- Use `try()` for optional values
- Follow the folder naming convention: `0X_{type}/`

## Provider

```hcl
terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.28.0"
    }
  }

  backend "gcs" {
    bucket = "tfapporg-terraform-state"
    prefix = "gcp-governance"
  }
}

provider "google" {
  project = var.project_id
  region  = "europe-west8"
}
```

## Validations

- Always add `description` to variables
- Use `try()` for optional values in JSON
- Check with `#problems` for any errors after modifications
- Run `terraform fmt` before committing

## References

Follow conventions in `#file:.github/copilot-instructions.md`
```
