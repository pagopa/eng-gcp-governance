<!-- markdownlint-disable-file MD041 -->
<!-- PR title format: <type>(<scope>): <summary> -->
<!-- Examples: feat(terraform): add new SCP policy -->
<!--           fix(scripts): correct JSON validation logic -->

## Description

<!-- Describe the governance change and the intended enforcement behavior. -->

## Change Type

- [ ] Custom role update
- [ ] Policy definition update
- [ ] Policy assignment update
- [ ] Terraform module/refactor update
- [ ] Documentation only
- [ ] Other

## Governance Impact

- Scope level (`org`, `folder`, `project`):
- Affected policies/roles:
- Enforcement effect:
- Rollback strategy:

## Testing Instructions

<!-- Step-by-step instructions for reviewers to validate changes -->
1.
2.

## Validation Evidence

- Terraform plan summary:
- Non-production validation summary:
- Additional checks:

## Breaking Changes

- [ ] This PR contains breaking changes
<!-- If checked, describe what breaks and migration path -->

## Checklist

- [ ] Governance effect is explicit and justified
- [ ] Scope (`org`/`folder`/`project`) is correct
- [ ] `terraform fmt -recursive` and `terraform validate` executed
- [ ] Non-production verification completed for impactful changes
- [ ] No sensitive data included
