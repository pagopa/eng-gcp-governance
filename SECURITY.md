# Security Policy

## Reporting Vulnerabilities

If you discover a security vulnerability in this repository, please report it responsibly:

1. **Do NOT** create a public GitHub issue
2. Contact the Cloud Engineering team directly
3. Provide details about the vulnerability
4. Allow time for the issue to be addressed

## Best Practices

### Credentials

- Never commit credentials, tokens, or secrets
- Use GCP Secret Manager for sensitive data
- Rotate credentials regularly
- Never create service account keys (policy enforced)

### Organization Policies

- Test policies in development first
- Consider impact before enforcing constraints
- Document exemptions and their justification
- Review policies regularly
- Get security approval before weakening policies

### Custom IAM Roles

- Follow least privilege principle
- Avoid wildcard permissions
- Document why each permission is needed
- Review roles periodically
- Create roles at organization level, not project

### Terraform State

- State files contain sensitive information
- State is stored in GCS bucket `tfapporg-terraform-state`
- Access to state is restricted
- Never commit state files to the repository

## Security Policies Enforced

This repository enforces the following security policies:

| Policy | Description |
|--------|-------------|
| `storage.publicAccessPrevention` | Prevents public bucket access |
| `iam.managed.disableServiceAccountKeyCreation` | Blocks SA key creation |
| `iam.managed.disableServiceAccountKeyUpload` | Blocks SA key upload |
| `compute.skipDefaultNetworkCreation` | Prevents default VPC |

## Security Checks

The CI pipeline includes:

- Terraform validation
- Trivy security scanning
- Pre-commit hooks for common issues
- Code review requirements for all changes

## Sensitive Data

The following are considered sensitive and must NOT be committed:

- Service account keys
- API keys
- Passwords or secrets
- Terraform state files
- `.terraform/` directories
