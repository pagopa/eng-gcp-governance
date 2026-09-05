# Custom Assignment Module

This reusable Terraform module applies project-level GCP organization policies
to the projects listed in its local configuration.

- [Purpose](#purpose)
- [Responsibilities](#responsibilities)
- [Inputs and outputs](#inputs-and-outputs)
- [Validation](#validation)

## Purpose

Use this module from the policy-assignment root for the shared custom assignment
set.

## Responsibilities

- Set allowed resource locations for configured projects.
- Configure the managed service-account-key-creation policy.
- Keep the module free of a backend so state remains owned by the assignment root.

## Inputs and outputs

The module has no declared inputs or outputs. Its project targets and policy
values are currently defined in local Terraform configuration.

## Validation

Validate this module through
[src/03_policy_assignments/](../../README.md) and the repository pre-commit
Terraform hooks. Review all project targets before changing enforcement values.

No diagram is provided because this module has two policy resources and its root
relationship is documented in
[src/03_policy_assignments/README.md](../../README.md).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.28.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_org_policy_policy.gcp_resourceLocations](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |
| [google_org_policy_policy.iam_managed_disableServiceAccountKeyCreation](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
