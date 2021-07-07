# Create the EC2 IAM role to use for the image
module "image_builder_role" {
  source = "git@gitlab.com:cloudly-engineer/aws/tf-modules/iam-ec2-role.git"

  ec2_iam_role_name  = "svc-image-builder-role"
  policy_description = "IAM ec2 instance profile for the Image Builder instances."
  assume_role_policy = file("assumption-policy.json")
  policy             = data.aws_iam_policy_document.web_server.json
}
