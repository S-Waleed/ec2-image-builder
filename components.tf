resource "aws_s3_bucket_object" "cw_agent_upload" {
  bucket = var.aws_s3_bucket_object
  key    = "/files/amazon-cloudwatch-agent-linux.yml"
  source = "${path.module}/files/amazon-cloudwatch-agent-linux.yml"
  # If the md5 hash is different it will re-upload
  etag = filemd5("${path.module}/files/amazon-cloudwatch-agent-linux.yml")
}

data "aws_kms_key" "image_builder" {
  key_id = "alias/image-builder"
}

# Amazon Cloudwatch agent
resource "aws_imagebuilder_component" "cw_agent" {
  name       = "amazon-cloudwatch-agent-linux"
  platform   = "Linux"
  uri        = "s3://${var.aws_s3_bucket_object}/files/amazon-cloudwatch-agent-linux.yml"
  version    = "1.0.0"
  kms_key_id = data.aws_kms_key.image_builder.arn

  depends_on = [
    aws_s3_bucket_object.cw_agent_upload
  ]
}
