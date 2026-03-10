---
description: Modify an existing GCP organization policy assignment while preserving repository conventions and safety checks.
name: internal-modify-policy
agent: agent
argument-hint: policy_file=<relative-path> change_type=<enforcement|inheritance|conditions|values> new_value=<summary>
---

# Internal GCP Policy Modification Task

## Instructions
1. Use `.github/skills/tech-ai-cloud-policy/SKILL.md`.
2. Update only the requested policy file under `src/03_policy_assignments/modules/`.
3. Preserve the existing resource shape already used in that file, especially:
   - `name` and `parent` based on `var.folder_id`;
   - explicit `inherit_from_parent`;
   - `rules` blocks formatted in the repository's current Terraform style.
4. When changing `conditions` or `values`, mirror the nearest existing policy that already uses those blocks instead of inventing a new structure.
5. Treat any weakening of enforcement as a high-risk change and keep the rationale explicit in the implementation summary.
6. Avoid unrelated refactors in the same module while modifying the policy.
7. Do not replace variable-driven folder references with hardcoded IDs.

## Minimal example
- Input: `policy_file=src/03_policy_assignments/modules/pagopa/01_storage_publicAccessPrevention.tf change_type=enforcement new_value=FALSE`
- Expected output:
  - Only the targeted policy file is updated.
  - The resource still uses `var.folder_id` and explicit `inherit_from_parent`.
  - The summary clearly states the impact of the enforcement change.

## Validation
- Run `terraform fmt -check` in `src/03_policy_assignments`.
- Run `terraform validate` in `src/03_policy_assignments`.
- Verify the edited policy still matches the naming and module conventions of its sibling files.
