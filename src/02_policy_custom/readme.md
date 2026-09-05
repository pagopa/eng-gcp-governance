# Custom Policy Definitions

This Terraform root contains source for custom GCP organization policy
constraints.

- [Purpose](#purpose)
- [Responsibilities](#responsibilities)
- [Inputs and outputs](#inputs-and-outputs)
- [Validation](#validation)

## Purpose

Use this root to define policy constraints before they are consumed by
governance assignments.

## Responsibilities

- Keep custom policy definitions separate from policy assignments.
- Describe each custom constraint's resource type, methods, and condition.
- Record each custom constraint's deny behavior explicitly.
- Preserve the root's separate Terraform state prefix.
- Use `eng-gcp-governance/policy_custom` for that prefix.

## Inputs and outputs

The root accepts organization, project, region, and zone variables and has no
declared Terraform outputs. The current public-bucket constraint is stored as
`02_policy_public_buckets.tf.txt`, so its activation as Terraform configuration
is not evidenced.

## Validation

Review the constraint source and run the configured Terraform hooks before
changing its file extension or applying it. Test policy changes in development
first and obtain security review before weakening enforcement.

No diagram is provided because this root's upstream and downstream relationships
are already shown in [docs/architecture.md](../../docs/architecture.md).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.28.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ProjectID Google Cloud | `string` | `"organization-443016"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region Google Cloud | `string` | `"europe-west8"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone Google Cloud | `string` | `"europe-west8-a"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
