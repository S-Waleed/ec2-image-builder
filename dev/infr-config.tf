resource "aws_imagebuilder_infrastructure_configuration" "example" {
  description                   = "example description"
  instance_profile_name         = aws_iam_instance_profile.example.name
  instance_types                = ["t2.nano", "t3.micro"]
  key_pair                      = aws_key_pair.example.key_name
  name                          = "example"
  security_group_ids            = [aws_security_group.example.id]
  sns_topic_arn                 = aws_sns_topic.example.arn
  subnet_id                     = aws_subnet.main.id
  terminate_instance_on_failure = true

  logging {
    s3_logs {
      s3_bucket_name = aws_s3_bucket.example.bucket
      s3_key_prefix  = "logs"
    }
  }

  tags = {
    foo = "bar"
  }
}
