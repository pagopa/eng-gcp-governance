# 03_policy_assignments

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.28.0 |

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

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_GCP_project_id"></a> [GCP\_project\_id](#output\_GCP\_project\_id) | n/a |
| <a name="output_GCP_project_number"></a> [GCP\_project\_number](#output\_GCP\_project\_number) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
