terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.53.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_cli_profile
}

# terraform {
#   backend "s3" {}
# }
