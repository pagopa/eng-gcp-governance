<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | n/a | `string` | `"520838205140"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ProjectID Google Cloud | `string` | `"organization-443016"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region Google Cloud | `string` | `"europe-west8"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone Google Cloud | `string` | `"europe-west8-a"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
