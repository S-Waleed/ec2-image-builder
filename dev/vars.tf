variable aws_region {
  default = "us-east-1"
}

variable aws_cli_profile {
  default = "dev"
}

variable "ec2_iam_role_name" {
  type = string
  default = "svc-image-builder-role"
}

variable "aws_s3_log_bucket" {
  type = string
  default = "cloudly-engineer-dev-logs"
}
