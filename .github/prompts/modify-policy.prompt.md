---
agent: edit
description: Modify an existing GCP Organization Policy
---

# Modify Organization Policy

## Context

Modify an existing GCP Organization Policy assignment. This could involve changing enforcement, inheritance, or adding conditions.

## Required Inputs

- **Policy File**: ${input:policy_file} (Path to the policy file to modify)
- **Change Type**: ${input:change_type:enforcement,inheritance,conditions,values}
- **New Value**: ${input:new_value}

## Instructions

### 1. Locate the Policy File

Find the policy in the appropriate module:
- Organization-wide: `src/03_policy_assignments/modules/pagopa/`
- Environment-specific: `src/03_policy_assignments/modules/<env>/`

### 2. Understand the Change

#### Change Enforcement

```hcl
# Before
rules {
  enforce = "TRUE"
}

# After
rules {
  enforce = "FALSE"
}
```

#### Change Inheritance

```hcl
# Before
spec {
  inherit_from_parent = false
  # ...
}

# After
spec {
  inherit_from_parent = true
  # ...
}
```

#### Add Conditions (for list constraints)

```hcl
spec {
  inherit_from_parent = false

  rules {
    condition {
      expression  = "resource.matchTag('env', 'prod')"
      title       = "Production only"
      description = "Apply only to production resources"
    }
    values {
      allowed_values = ["europe-west8"]
    }
  }
}
```

#### Modify Allowed/Denied Values

```hcl
rules {
  values {
    allowed_values = [
      "europe-west8",
      "europe-west1",
      # Add new allowed values
    ]
    denied_values = [
      "us-*",
      # Add denied values
    ]
  }
}
```

## Security Considerations

⚠️ **Before modifying a policy:**

1. Understand the security implications
2. Document why the change is needed
3. Get security team approval if weakening enforcement
4. Test in lower environments first (dev → uat → prod)

## Validations

- [ ] Policy file exists and is correctly identified
- [ ] Change is justified and documented
- [ ] Security implications understood
- [ ] `inherit_from_parent` remains explicitly set
- [ ] Terraform syntax is valid

## References

Follow the conventions in `#file:.github/copilot-instructions.md`

## Warning

🔒 **Weakening policies requires security review!**

If changing `enforce = "TRUE"` to `enforce = "FALSE"` or similar weakening:
1. Document the business justification
2. Get security team approval
3. Consider time-limited exceptions instead
