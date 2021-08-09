provider "aws" {
  region  = var.aws_region
  profile = var.aws_cli_profile
}

# terraform {
#   backend "s3" {}
# }
