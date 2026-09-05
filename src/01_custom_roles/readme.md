# Custom Roles

This Terraform root defines organization-level custom IAM roles for GCP
governance workloads.

- [Purpose](#purpose)
- [Responsibilities](#responsibilities)
- [Inputs and outputs](#inputs-and-outputs)
- [Validation](#validation)

## Purpose

Use this root for custom role definitions that require a least-privilege
permission set at organization scope.

## Responsibilities

- Define custom roles in Terraform resources.
- Keep permission selection explicit and avoid wildcard permissions.
- Preserve the root's separate Terraform state prefix, `eng-gcp-governance/custom_roles`.

## Inputs and outputs

The root accepts organization, project, region, and zone variables. It creates
custom IAM roles and has no declared Terraform outputs. Generated details are
kept below the `TF_DOCS` marker.

## Validation

Run the root's `terraform.sh` through the repository's normal review process.
Before merge, use the configured Terraform formatting, documentation,
validation, and lint hooks. Do not use `apply` during documentation work.

No diagram is provided because this root has one primary resource type and its
relationship to the other policy layers is documented in
[docs/architecture.md](../../docs/architecture.md).

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
| [google_organization_iam_custom_role.pagopa_mailsage_user](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/organization_iam_custom_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | n/a | `string` | `"520838205140"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ProjectID Google Cloud | `string` | `"organization-443016"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region Google Cloud | `string` | `"europe-west8"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone Google Cloud | `string` | `"europe-west8-a"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
