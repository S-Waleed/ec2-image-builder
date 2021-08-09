# remote_state {
#   backend = "s3"
#   config = {
#     bucket  = "cloudly-engineer-${path_relative_to_include()}-tf-state"
#     key     = "${path_relative_to_include()}/iam/terraform.tfstate"
#     region  = local.local_inputs.aws_region,
#     profile = local.local_inputs.aws_cli_profile
#     encrypt = true
#   }
# }
