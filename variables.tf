variable "aws_region" {
  type        = string
  description = "The AWS region."
}

variable "aws_cli_profile" {
  type        = string
  description = "The AWS CLI profile name."
}

variable "ec2_iam_role_name" {
  type        = string
  description = "The EC2's IAM role name."
}

variable "aws_s3_log_bucket" {
  type        = string
  description = "The S3 bucket name to send logs to."
}

variable "aws_s3_bucket" {
  type        = string
  description = "The S3 bucket name that stores the Image Builder componeent files."
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

variable "ami_name_tag" {
  type = string
}
