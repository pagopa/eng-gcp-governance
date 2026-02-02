# Code Review Instructions - eng-gcp-governance

## 🎯 Review Focus

### For Custom IAM Roles (`01_custom_roles/`)

| Check | What to Verify |
|-------|---------------|
| **Least Privilege** | Only necessary permissions are included |
| **Permission Validity** | Permissions exist and are correctly spelled |
| **Role Naming** | Follows `pagopa_<domain>_<purpose>` convention |
| **Organization Level** | Role is created at org level, not project |
| **Description** | Clear description of role purpose |

### For Organization Policies (`02_policy_custom/`, `03_policy_assignments/`)

| Check | What to Verify |
|-------|---------------|
| **Constraint Name** | Valid GCP constraint identifier |
| **Inheritance** | `inherit_from_parent` explicitly set |
| **Enforcement** | Correct `enforce` value for security intent |
| **Target** | Correct folder/project targeted |
| **Module Usage** | Assignments use appropriate modules |

### For All Terraform Files

| Check | What to Verify |
|-------|---------------|
| **Formatting** | `terraform fmt` applied |
| **Variables** | No hardcoded IDs, use variables |
| **Provider Version** | Pinned to approved version |
| **Backend Config** | Correct state path |
| **Naming Convention** | File numbering prefix followed |

## ⚠️ Red Flags

Flag immediately if you see:

1. 🚨 **Overly permissive roles**
   - Wildcard permissions (`*`)
   - Admin-level permissions without justification
   - `owner` or `editor` equivalent permissions

2. 🚨 **Policy weakening**
   - Disabling security policies
   - `enforce = "FALSE"` on security constraints
   - Removing existing policies

3. 🚨 **Hardcoded values**
   - Folder IDs in resource blocks
   - Project IDs in resource blocks
   - Organization IDs in resource blocks

4. 🚨 **Missing inheritance control**
   - No `inherit_from_parent` specification
   - Unexpected inheritance changes

5. 🚨 **Security policy exceptions**
   - `storage.publicAccessPrevention` disabled
   - Service account key creation enabled
   - Default network creation enabled

6. 🚨 **State/Backend issues**
   - Modified backend configuration
   - State files in PR
   - `.terraform/` directory changes

## ✅ Approve If

- [ ] All permissions follow least privilege principle
- [ ] Policies are correctly targeted (folder/project)
- [ ] `inherit_from_parent` is explicitly configured
- [ ] No hardcoded IDs (uses variables)
- [ ] Terraform formatting is correct
- [ ] File naming follows conventions
- [ ] Security review completed (for policy changes)
- [ ] Pre-commit hooks pass

## 📝 Review Checklist by Change Type

### New Custom Role

```checklist
- [ ] Role ID follows naming convention
- [ ] Permissions are minimal for the use case
- [ ] All permissions are valid GCP permissions
- [ ] Description explains the role's purpose
- [ ] Role is at organization level
```

### New Policy Assignment

```checklist
- [ ] Constraint name is valid
- [ ] Target folder/project is correct
- [ ] inherit_from_parent is set appropriately
- [ ] Enforcement aligns with security requirements
- [ ] Module structure is used correctly
```

### Policy Modification

```checklist
- [ ] Change is justified and documented
- [ ] No unintended security regression
- [ ] Affected environments are identified
- [ ] Security team has approved (if weakening)
```

## 🔍 Suggested Review Comments

### For permission issues

```
⚠️ This permission seems broader than needed. Consider using a more specific permission like `<specific.permission>` instead of `<broad.permission>`.
```

### For missing inheritance

```
❌ Missing `inherit_from_parent` specification. Please explicitly set this to `true` or `false` to clarify the inheritance intent.
```

### For hardcoded values

```
❌ Hardcoded folder ID detected. Please use `var.folder_id_<env>` variable instead.
```

### For security policy changes

```
🔒 This change affects a security policy. Please ensure security team has reviewed and approved this change.
```
