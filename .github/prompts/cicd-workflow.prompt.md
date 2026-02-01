```prompt
---
agent: agent
description: Create or modify GitHub Actions workflows for CI/CD
---

# CI/CD Workflow

## Context

I need to create or modify a GitHub Actions workflow for GCP governance (policies, custom roles).

## Discovery

Analyze existing workflows with `#codebase` in `.github/workflows/`.

## Input Required

- **Workflow name**: ${input:workflow_name}
- **Purpose**: ${input:purpose}

## Template

```yaml
# 📋 {workflow_name}.yml
# 🎯 Purpose: {purpose}

name: {workflow_name}

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

permissions:
  id-token: write
  contents: read

env:
  GCP_PROJECT_ID: ${{ secrets.GCP_PROJECT_ID }}
  GCP_REGION: europe-west8

jobs:
  plan:
    runs-on: ubuntu-latest
    steps:
      - name: 📥 Checkout
        uses: actions/checkout@v4

      - name: 🔐 Authenticate to Google Cloud
        uses: google-github-actions/auth@v2
        with:
          workload_identity_provider: ${{ secrets.WIF_PROVIDER }}
          service_account: ${{ secrets.WIF_SERVICE_ACCOUNT }}

      - name: 🏗️ Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: "~> 1.7"
```

## References

Follow conventions in `#file:.github/copilot-instructions.md`
```
