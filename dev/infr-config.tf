resource "aws_imagebuilder_infrastructure_configuration" "example" {
  description                   = "example description"
  instance_profile_name         = var.ec2_iam_role_name
  instance_types                = ["t2.nano", "t3.micro"]
  key_pair                      = aws_key_pair.example.key_name
  name                          = "example"
  security_group_ids            = [aws_security_group.example.id]
#   sns_topic_arn                 = aws_sns_topic.example.arn
  subnet_id                     = aws_subnet.main.id
  terminate_instance_on_failure = true

  logging {
    s3_logs {
      s3_bucket_name = var.aws_s3_log_bucket
      s3_key_prefix  = "image-builder"
    }
  }

  tags = {
    foo = "bar"
  }
}
