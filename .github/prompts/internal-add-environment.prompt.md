---
description: Add a new environment module for GCP organization policy assignments.
name: internal-add-environment
agent: agent
argument-hint: env_name=<name> folder_id=<id> folder_description=<text>
---

# Internal GCP Environment Module Task

## Instructions
1. Use `.github/skills/tech-ai-terraform-feature/SKILL.md`.
2. Create the module directory `src/03_policy_assignments/modules/${input:env_name}/`.
3. Match the existing module layout already used by `modules/dev/`:
   - `00_main.tf`
   - `99_variables.tf`
   - `readme.md`
4. Update `src/03_policy_assignments/99_variables.tf` with `variable "folder_id_${input:env_name}"`.
5. Add the matching module call in `src/03_policy_assignments/02_${input:env_name}.tf`, following the same structure used by `02_dev.tf`, `02_uat.tf`, or `02_prod.tf`.
6. Keep the new folder ID wired through variables rather than hardcoding it inside policy resources.
7. Do not add policy files to unrelated environment modules while scaffolding the new one.

## Minimal example
- Input: `env_name=sandbox folder_id=123456789012 folder_description="Sandbox folder"`
- Expected output:
  - A new module directory under `src/03_policy_assignments/modules/sandbox/`.
  - `folder_id_sandbox` added to `src/03_policy_assignments/99_variables.tf`.
  - A new `src/03_policy_assignments/02_sandbox.tf` module call wired to that variable.

## Validation
- Run `terraform fmt -check` in `src/03_policy_assignments`.
- Run `terraform validate` in `src/03_policy_assignments`.
- Verify the module directory, variable name, and module call all use the same environment identifier.
