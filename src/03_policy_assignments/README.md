# 03_policy_assignments

This Terraform root assigns GCP organization policies to folders and projects
through local target modules.

- [Purpose](#purpose)
- [Responsibilities](#responsibilities)
- [Inputs and outputs](#inputs-and-outputs)
- [Module map](#module-map)
- [Validation](#validation)

## Purpose

Use this root after reviewing the custom role and policy-definition layers to
coordinate policy assignments across governance targets.

## Responsibilities

- Load the `custom`, `dev`, `pagopa`, `prod`, and `uat` assignment modules.
- Provide assignment-root variables and outputs.
- Target the configured GCP projects and folders.
- Preserve the root's separate Terraform state prefix.
- Use `eng-gcp-governance/policy_assignments` for that prefix.

## Inputs and outputs

The root defines project, folder, region, and zone inputs and exposes the
configured GCP project ID and project number. `pagopa` receives
`folder_id_pagopa`; the other module calls currently use local module defaults
or no arguments.

## Module map

| Module | Current evidence |
| --- | --- |
| `custom` | Project-level location and service-account key policies. |
| `pagopa` | Folder-level location, public-access, and key policies. |
| `dev` | No resources in the current generated documentation. |
| `prod` | No resources in the current generated documentation. |
| `uat` | No resources in the current generated documentation. |

## Validation

Review the root and selected module together. Run the configured Terraform
formatting, documentation, validation, and lint hooks. A mutating `plan` or
`apply` requires the repository's GCP authentication and backend context and is
outside documentation validation.

No diagram is provided because the complete layer flow is maintained in
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom_assignments"></a> [custom\_assignments](#module\_custom\_assignments) | ./modules/custom | n/a |
| <a name="module_dev_assignments"></a> [dev\_assignments](#module\_dev\_assignments) | ./modules/dev | n/a |
| <a name="module_pagopa_assignments"></a> [pagopa\_assignments](#module\_pagopa\_assignments) | ./modules/pagopa | n/a |
| <a name="module_prod_assignments"></a> [prod\_assignments](#module\_prod\_assignments) | ./modules/prod | n/a |
| <a name="module_uat_assignments"></a> [uat\_assignments](#module\_uat\_assignments) | ./modules/uat | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id_pagopa"></a> [folder\_id\_pagopa](#input\_folder\_id\_pagopa) | FolderID Google Cloud | `string` | `"47551051631"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ProjectID Google Cloud | `string` | `"organization-443016"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region Google Cloud | `string` | `"europe-west8"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone Google Cloud | `string` | `"europe-west8-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_GCP_project_id"></a> [GCP\_project\_id](#output\_GCP\_project\_id) | n/a |
| <a name="output_GCP_project_number"></a> [GCP\_project\_number](#output\_GCP\_project\_number) | n/a |
<!-- END_TF_DOCS -->
