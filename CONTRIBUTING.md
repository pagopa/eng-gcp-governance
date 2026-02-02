# Contributing to eng-gcp-governance

## Quick Start

1. Clone the repository
2. Install required tools:
   - [tfenv](https://github.com/tfutils/tfenv) for Terraform version management
   - [gcloud CLI](https://cloud.google.com/sdk/docs/install) for GCP authentication
   - [pre-commit](https://pre-commit.com/) for Git hooks
3. Run `pre-commit install` to set up hooks
4. Authenticate with GCP: `gcloud auth login`

## Making Changes

### Important: Apply Order

Changes must be applied in folder number order:

1. `01_custom_roles` - Custom IAM role definitions
2. `02_policy_custom` - Organization Policy definitions
3. `03_policy_assignments` - Policy assignments to folders/projects

### Adding Organization Policies

1. Create in appropriate module under `src/03_policy_assignments/modules/`
2. Follow naming: `01_<service>_<constraint>.tf`
3. Always set `inherit_from_parent` explicitly
4. Test with `./terraform.sh plan`

### Adding Custom Roles

1. Create in `src/01_custom_roles/`
2. Follow naming: `pagopa_<domain>_<purpose>`
3. Apply least privilege principle
4. Document permission justifications

## Conventions

### Commit Messages

Use conventional commits format:

```
<type>(<scope>): <description>
```

Types: `feat`, `fix`, `chore`, `docs`, `refactor`, `security`

Scopes: `roles`, `policies`, `assignments`, `pagopa`, `dev`, `uat`, `prod`

### File Naming

- Policy files: `01_<service>_<constraint>.tf`
- Role files: `02_<domain>_<purpose>.tf`
- Config files: `00_main.tf`, `99_variables.tf`, `99_outputs.tf`

### Code Style

- Run `terraform fmt` before committing
- Use variables for all IDs (no hardcoded values)
- Include descriptions for all resources

## Pre-commit Hooks

The following hooks run automatically:

- `terraform_fmt` - Format Terraform files
- `terraform_docs` - Generate documentation
- `terraform_trivy` - Security scanning
- `terraform_validate` - Validate configuration

## Testing Changes

```bash
cd src/<module>
./terraform.sh plan    # Review changes
./terraform.sh apply   # Apply changes (after review)
```

## Getting Help

- Check the [README.md](README.md) for project overview
- See [AGENTS.md](AGENTS.md) for AI assistant guidance
- Review [.github/copilot-instructions.md](.github/copilot-instructions.md) for conventions
