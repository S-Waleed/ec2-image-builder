variable "aws_region" {
  type = string
}

variable "aws_cli_profile" {
  type = string
}

variable "ec2_iam_role_name" {
  type = string
}

variable "aws_s3_log_bucket" {
  type = string
}

variable "aws_s3_bucket_object" {
  type = string
}

variable "ebs_root_vol_size" {
  type = number
}

variable "aws_key_pair_name" {
  type = string
}

variable "image_receipe_version" {
  type = string
}
