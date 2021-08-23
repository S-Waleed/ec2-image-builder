# Create the EC2 IAM role to use for the image
module "image_builder_role" {
  source = "git@github.com:masterwali/tf-module-iam-ec2-role.git"

  ec2_iam_role_name  = var.ec2_iam_role_name
  policy_description = "IAM ec2 instance profile for the Image Builder instances."
  assume_role_policy = file("files/assumption-policy.json")
  policy             = data.aws_iam_policy_document.image_builder.json
}

data "aws_region" "current" {}
data "aws_partition" "current" {}

data "aws_subnet" "this" {
  filter {
    name   = "tag:Name"
    values = ["default-public-1d"]
  }
}

data "aws_security_group" "this" {
  filter {
    name   = "tag:Name"
    values = ["default-sec-group"]
  }
}
