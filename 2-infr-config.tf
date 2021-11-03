resource "aws_imagebuilder_infrastructure_configuration" "this" {
  description                   = "Simple infrastructure configuration"
  instance_profile_name         = var.ec2_iam_role_name
  instance_types                = ["t2.micro"]
  key_pair                      = var.aws_key_pair_name
  name                          = "amazon-linux-infr"
  security_group_ids            = [data.aws_security_group.this.id]
  subnet_id                     = data.aws_subnet.this.id
  terminate_instance_on_failure = true

  logging {
    s3_logs {
      s3_bucket_name = var.aws_s3_log_bucket
      s3_key_prefix  = "image-builder"
    }
  }

  tags = {
    Name = "amazon-linux-infr"
  }
}
