# image-builder

A Terraform module that creates and manages an Amazon Machine Image (AMI) with EC2 Image Builder service.

Read the details in this blog post: <https://cloudly.engineer/?p=1350>

## Deploy

Use Terragrunt or Terraform to deploy to various environments/AWS accounts. See <https://cloudly.engineer/2020/intro-to-terragrunt-and-terraform/aws/> for more details.

## Author

Waleed from <https://cloudly.engineer>

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_image_builder_role"></a> [image\_builder\_role](#module\_image\_builder\_role) | git@github.com:masterwali/tf-module-iam-ec2-role.git | master |

## Resources

| Name | Type |
|------|------|
| [aws_imagebuilder_component.cw_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_component) | resource |
| [aws_imagebuilder_distribution_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_distribution_configuration) | resource |
| [aws_imagebuilder_image.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_image) | resource |
| [aws_imagebuilder_image_pipeline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_image_pipeline) | resource |
| [aws_imagebuilder_image_recipe.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_image_recipe) | resource |
| [aws_imagebuilder_infrastructure_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_infrastructure_configuration) | resource |
| [aws_s3_bucket_object.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_iam_policy_document.image_builder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_kms_key.image_builder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_name_tag"></a> [ami\_name\_tag](#input\_ami\_name\_tag) | n/a | `string` | n/a | yes |
| <a name="input_aws_cli_profile"></a> [aws\_cli\_profile](#input\_aws\_cli\_profile) | The AWS CLI profile name. | `string` | n/a | yes |
| <a name="input_aws_key_pair_name"></a> [aws\_key\_pair\_name](#input\_aws\_key\_pair\_name) | n/a | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region. | `string` | n/a | yes |
| <a name="input_aws_s3_bucket"></a> [aws\_s3\_bucket](#input\_aws\_s3\_bucket) | The S3 bucket name that stores the Image Builder componeent files. | `string` | n/a | yes |
| <a name="input_aws_s3_log_bucket"></a> [aws\_s3\_log\_bucket](#input\_aws\_s3\_log\_bucket) | The S3 bucket name to send logs to. | `string` | n/a | yes |
| <a name="input_ebs_root_vol_size"></a> [ebs\_root\_vol\_size](#input\_ebs\_root\_vol\_size) | n/a | `number` | n/a | yes |
| <a name="input_ec2_iam_role_name"></a> [ec2\_iam\_role\_name](#input\_ec2\_iam\_role\_name) | The EC2's IAM role name. | `string` | n/a | yes |
| <a name="input_image_receipe_version"></a> [image\_receipe\_version](#input\_image\_receipe\_version) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
