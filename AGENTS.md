# AGENTS.md - eng-gcp-governance

This file is for **OpenAI Codex CLI** and other AI agents working with this repository.

## 📚 Main Instructions

👉 **[.github/copilot-instructions.md](.github/copilot-instructions.md)**

Read this file first to understand the repository's purpose, structure, and conventions.

## 📂 Configuration Files

| File | Purpose |
|------|---------|
| [.github/copilot-instructions.md](.github/copilot-instructions.md) | Global instructions for this repository |
| [.github/copilot-code-review-instructions.md](.github/copilot-code-review-instructions.md) | Code review guidelines |
| [.github/copilot-commit-message-instructions.md](.github/copilot-commit-message-instructions.md) | Commit message format |
| [.github/instructions/terraform.instructions.md](.github/instructions/terraform.instructions.md) | Terraform file conventions |
| [.github/instructions/scripts.instructions.md](.github/instructions/scripts.instructions.md) | Shell script conventions |
| [.github/instructions/json.instructions.md](.github/instructions/json.instructions.md) | JSON file conventions |
| [.github/instructions/markdown.instructions.md](.github/instructions/markdown.instructions.md) | Documentation conventions |

## 🎯 Available Prompts

| Prompt | Description |
|--------|-------------|
| [add-policy-assignment](.github/prompts/add-policy-assignment.prompt.md) | Create a new GCP Organization Policy assignment |
| [add-custom-role](.github/prompts/add-custom-role.prompt.md) | Create a new custom IAM role |
| [add-environment](.github/prompts/add-environment.prompt.md) | Add a new environment folder for policy assignments |
| [modify-policy](.github/prompts/modify-policy.prompt.md) | Modify an existing organization policy |

## ⚡ Quick Reference

### Repository Structure

```
src/
├── 01_custom_roles/     → Custom IAM roles (least privilege)
├── 02_policy_custom/    → Organization Policy definitions
└── 03_policy_assignments/
    └── modules/
        ├── pagopa/      → Organization-wide policies
        ├── dev/         → Development environment
        ├── uat/         → UAT environment
        ├── prod/        → Production environment
        └── custom/      → Custom policies
```

### Key Conventions

| What | Convention |
|------|------------|
| Role ID | `pagopa_<domain>_<purpose>` |
| Policy file | `01_<service>_<constraint>.tf` |
| Variables | Always use `var.*` not hardcoded IDs |
| Inheritance | Always set `inherit_from_parent` explicitly |
| Provider | Pin to specific version (`6.28.0`) |

### Common Commands

```bash
# Apply Terraform changes
cd src/01_custom_roles && ./terraform.sh plan
cd src/02_policy_custom && ./terraform.sh plan
cd src/03_policy_assignments && ./terraform.sh plan

# Format Terraform files
terraform fmt -recursive

# Run pre-commit hooks
pre-commit run --all-files
```

## 🚫 Do NOT

1. ❌ Create overly permissive roles
2. ❌ Disable security policies without approval
3. ❌ Hardcode folder/project/organization IDs
4. ❌ Skip `inherit_from_parent` in policies
5. ❌ Use deprecated `google_organization_policy` resource
6. ❌ Commit `.terraform/` or state files
7. ❌ Modify backend configuration without coordination

## 🔐 GCP Context

| Resource | Value |
|----------|-------|
| Organization ID | `520838205140` |
| Region | `europe-west8` (Milan) |
| State Bucket | `tfapporg-terraform-state` |
| Terraform Version | `>= 1.7.0` |
| Provider Version | `6.28.0` |

## 📋 Common Tasks

### Add a New Organization Policy

1. Identify the GCP constraint name
2. Choose the target environment/folder
3. Create file in appropriate module: `src/03_policy_assignments/modules/<env>/01_<service>_<constraint>.tf`
4. Use the `google_org_policy_policy` resource
5. Set `inherit_from_parent` explicitly

### Add a New Custom Role

1. Define the minimum permissions needed
2. Create file: `src/01_custom_roles/02_<domain>_<purpose>.tf`
3. Use `pagopa_<domain>_<purpose>` as role_id
4. Add clear title and description

### Apply Changes

```bash
cd src/<module>
./terraform.sh plan    # Review changes
./terraform.sh apply   # Apply changes
```
