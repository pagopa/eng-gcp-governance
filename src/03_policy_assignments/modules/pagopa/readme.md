# PagoPA Assignment Module

This reusable Terraform module applies folder-level GCP organization policies
for the PagoPA governance target.

- [Purpose](#purpose)
- [Responsibilities](#responsibilities)
- [Inputs and outputs](#inputs-and-outputs)
- [Validation](#validation)

## Purpose

Use this module from the policy-assignment root when the target folder is
supplied through `folder_id`.

## Responsibilities

- Restrict allowed resource locations to the configured location set.
- Enforce Cloud Storage public-access prevention.
- Configure managed service-account-key creation and upload policies.
- Keep policy inheritance explicit for each assignment.

## Inputs and outputs

The module requires `folder_id` and declares no Terraform outputs. The assignment
root supplies the PagoPA folder value.

## Validation

Validate this module through
[src/03_policy_assignments/](../../README.md) and the repository pre-commit
Terraform hooks. Review folder scope and policy impact before applying changes.

No diagram is provided because this module is a focused assignment
implementation and its relationship to the root is documented in
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
| [google_org_policy_policy.compute_skipDefaultNetworkCreation](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |
| [google_org_policy_policy.iam_managed_disableServiceAccountKeyCreation](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |
| [google_org_policy_policy.iam_managed_disableServiceAccountKeyUpload](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |
| [google_org_policy_policy.resource_allowed_locations](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |
| [google_org_policy_policy.storage_publicAccessPrevention](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | FolderID Google Cloud | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
