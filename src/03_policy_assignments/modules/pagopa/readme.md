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
| [google_org_policy_policy.iam_managed_disableServiceAccountKeyCreation](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |
| [google_org_policy_policy.resource_allowed_locations](https://registry.terraform.io/providers/hashicorp/google/6.28.0/docs/resources/org_policy_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | FolderID Google Cloud | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
