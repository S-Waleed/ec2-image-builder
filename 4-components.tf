resource "aws_s3_bucket_object" "this" {
  for_each = fileset("/files/", "*")

  bucket = var.aws_s3_bucket
  key    = "/files/${each.value}"
  source = "/files/${each.value}"
  # If the md5 hash is different it will re-upload
  etag = filemd5("/files/${each.value}")
}

data "aws_kms_key" "image_builder" {
  key_id = "alias/image-builder"
}

# Amazon Cloudwatch agent component
resource "aws_imagebuilder_component" "cw_agent" {
  name       = "amazon-cloudwatch-agent-linux"
  platform   = "Linux"
  uri        = "s3://${var.aws_s3_bucket}/files/amazon-cloudwatch-agent-linux.yml"
  version    = "1.0.1"
  kms_key_id = data.aws_kms_key.image_builder.arn

  depends_on = [
    aws_s3_bucket_object.this
  ]

  lifecycle {
    create_before_destroy = true
  }
}
