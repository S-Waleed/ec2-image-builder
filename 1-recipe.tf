resource "aws_imagebuilder_image" "this" {
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.this.arn
  image_recipe_arn                 = aws_imagebuilder_image_recipe.this.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.this.arn

  depends_on = [
    data.aws_iam_policy_document.image_builder
  ]
}

resource "aws_imagebuilder_image_recipe" "this" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      delete_on_termination = true
      volume_size           = var.ebs_root_vol_size
      volume_type           = "gp3"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.cw_agent.arn
  }

  name         = "amazon-linux-recipe"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = var.image_receipe_version
}

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

# Amazon Cloudwatch agent component
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
