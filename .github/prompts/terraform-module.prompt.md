---
agent: agent
description: Modify or create Terraform modules for GCP governance
---

# Terraform Module

## Context

I need to modify or extend Terraform configuration for GCP governance (custom roles, policies, assignments).

## Inputs

- **Modification type**: ${input:type:resource,variable,output,data_source,module}
- **Description**: ${input:description}

## Steps

1. Use the `terraform-module` skill in `.github/skills/terraform-module/SKILL.md`.
2. Analyze existing files with `#codebase` and:
   - `#file:src/01_custom_roles/`
   - `#file:src/02_policy_custom/`
   - `#file:src/03_policy_assignments/`
3. Implement changes following the skill template and repository instructions.

## Validations

- Run `terraform fmt` before committing.
- Check `#problems` for errors after changes.
