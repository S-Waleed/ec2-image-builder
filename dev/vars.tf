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

variable "aws_s3_bucket_object" {
  type = string
  default = "cloudly-engineer-dev-misc"
}

variable "ebs_root_vol_size" {
  default = 10
}

variable "aws_key_pair_name" {
  type = string
  default = "image-builder-kp"
}
