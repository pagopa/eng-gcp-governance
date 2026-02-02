---
applyTo: "**/*.sh,**/terraform.sh"
---

# Shell Scripts Instructions - eng-gcp-governance

## Script Header

Every shell script MUST have a descriptive header:

```bash
#!/usr/bin/env bash

#
# Script: <script_name>.sh
# Description: <Brief description of what the script does>
# Usage: ./<script_name>.sh [options]
#

set -euo pipefail
```

## terraform.sh Pattern

The standard `terraform.sh` script in each module:

```bash
#!/usr/bin/env bash

#
# Script: terraform.sh
# Description: Wrapper for Terraform operations in this module
# Usage: ./terraform.sh <plan|apply|destroy>
#

set -euo pipefail

ACTION="${1:-plan}"

case "$ACTION" in
  plan|apply|destroy)
    terraform init -backend-config="00_backend.tfvars"
    terraform "$ACTION"
    ;;
  *)
    echo "Usage: $0 <plan|apply|destroy>"
    exit 1
    ;;
esac
```

## Coding Standards

1. **Shebang**: Always use `#!/usr/bin/env bash`
2. **Strict mode**: Always include `set -euo pipefail`
3. **Quoting**: Always quote variables `"$var"` not `$var`
4. **Functions**: Use lowercase with underscores `my_function()`
5. **Constants**: Use UPPERCASE `MY_CONSTANT`

## Logging Pattern

```bash
log_info() {
  echo "🔍 [INFO] $*"
}

log_success() {
  echo "✅ [SUCCESS] $*"
}

log_error() {
  echo "❌ [ERROR] $*" >&2
}

log_warning() {
  echo "⚠️ [WARNING] $*"
}
```

## Best Practices

1. **Early exit** on errors
2. **Meaningful exit codes**
3. **Help/usage** message for complex scripts
4. **Input validation** before operations
5. **Idempotent** operations where possible

## Do NOT

- Use `#!/bin/bash` - use `#!/usr/bin/env bash` for portability
- Skip `set -euo pipefail`
- Use unquoted variables
- Hardcode paths or IDs
- Store credentials in scripts
