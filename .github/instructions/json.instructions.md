---
applyTo: "**/*.json"
---

# JSON Files Instructions - eng-gcp-governance

## Purpose

JSON files in this repository are primarily used for:

- Terraform variable files (alternative to `.tfvars`)
- Configuration exports
- Policy definitions (rarely)

## Formatting Rules

1. **Indentation**: 2 spaces (no tabs)
2. **Line endings**: LF (Unix-style)
3. **Final newline**: Required
4. **Trailing commas**: Not allowed in JSON
5. **Encoding**: UTF-8

## Validation

All JSON files must be valid JSON. Use `check-json` pre-commit hook.

## Example Structure

```json
{
  "key": "value",
  "nested": {
    "property": "value"
  },
  "array": [
    "item1",
    "item2"
  ]
}
```

## Do NOT

- Store sensitive data (credentials, keys) in JSON files
- Use JSON for Terraform variables when `.tfvars` is more appropriate
- Include comments (JSON doesn't support them)
