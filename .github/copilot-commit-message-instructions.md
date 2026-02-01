# Commit Message Instructions - eng-gcp-governance

## Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

## Types

| Type | When to Use |
|------|-------------|
| `feat` | New policy, new role, new assignment |
| `fix` | Fix incorrect policy, fix permissions |
| `chore` | Maintenance, dependency updates |
| `docs` | Documentation changes |
| `refactor` | Restructure without functional changes |
| `security` | Security-related changes |

## Scopes

| Scope | When to Use |
|-------|-------------|
| `roles` | Custom IAM roles (`01_custom_roles/`) |
| `policies` | Policy definitions (`02_policy_custom/`) |
| `assignments` | Policy assignments (`03_policy_assignments/`) |
| `pagopa` | Organization-wide changes |
| `dev` | Development environment changes |
| `uat` | UAT environment changes |
| `prod` | Production environment changes |
| `terraform` | Terraform configuration (providers, backend) |
| `ci` | CI/CD workflow changes |

## Examples

### New Custom Role

```
feat(roles): add mailsage user role

Add custom IAM role for MailSage project with minimal
aiplatform.endpoints.predict permission.
```

### New Policy Assignment

```
feat(assignments): enforce storage public access prevention on prod

Apply storage.publicAccessPrevention policy to production
folder to prevent accidental public bucket exposure.
```

### Policy Modification

```
fix(policies): correct resource locations constraint

Update allowed regions list to include europe-west8
for Milan datacenter compliance.
```

### Security Change

```
security(assignments): disable service account key creation

Enforce iam.managed.disableServiceAccountKeyCreation
across all folders to improve security posture.
```

### Documentation

```
docs: update README with terraform lock instructions
```

### Maintenance

```
chore(terraform): update google provider to 6.28.0
```

## Rules

1. **First line**: Max 72 characters
2. **Body**: Wrap at 80 characters
3. **Imperative mood**: "add" not "added", "fix" not "fixed"
4. **No period** at end of subject line
5. **Blank line** between subject and body
6. **Reference issues** in footer when applicable

## Footer Keywords

```
Refs: #123
Closes: #456
Security-Review: approved-by-@username
Breaking-Change: <description>
```
