---
agent: agent
description: Configure Copilot prompts and instructions for a repository
---

# Complete Copilot Setup for Repository

## Context

This prompt helps configure GitHub Copilot with prompts, instructions, and support files for a repository. It creates all necessary files to optimize the experience with Copilot and Codex.

## Preliminary Analysis

Before proceeding, analyze the repository to understand:

1. **Languages/Technologies used**: look for `.tf`, `.py`, `.sh`, `.json`, `.yaml` files, etc.
2. **Project structure**: main folders, organizational patterns
3. **Existing conventions**: naming, formatting, code styles
4. **CI/CD workflows**: `.github/workflows/`
5. **Existing documentation**: README, CONTRIBUTING, etc.

## Files to Create

### 1. Global Copilot Instructions

Create `.github/copilot-instructions.md` with:
- Repository purpose
- Project structure
- Main file schemas
- Mandatory conventions
- What NOT to do
- Design principles
- Target users
- Preferred workflow

### 2. Code Review Instructions

Create `.github/copilot-code-review-instructions.md` with:
- Review focus by file type
- Red flags to catch
- Approval criteria

### 3. Commit Message Instructions

Create `.github/copilot-commit-message-instructions.md` with:
- Format specification
- Types and scopes
- Examples

### 4. File Type Instructions

Create in `.github/instructions/`:
- `terraform.instructions.md` for `.tf` files
- `json.instructions.md` for `.json` files
- `scripts.instructions.md` for shell scripts
- `markdown.instructions.md` for documentation

### 5. Specific Prompts

Create in `.github/prompts/` for common operations:
- Adding new resources
- Modifying existing configurations
- Setting up new environments

### 6. AGENTS.md

Create `AGENTS.md` in root for Codex integration.

## References

See existing files for examples:
- `#file:.github/copilot-instructions.md`
- `#file:.github/instructions/terraform.instructions.md`
- `#file:.github/prompts/add-policy-assignment.prompt.md`
