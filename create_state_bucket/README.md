# create_state_bucket

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to provision | `string` | `"us-west-2"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Name of environment | `string` | `"Development"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tf-state-bucket-name"></a> [tf-state-bucket-name](#output\_tf-state-bucket-name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
