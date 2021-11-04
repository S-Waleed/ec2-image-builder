resource "aws_imagebuilder_image" "this" {
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.this.arn
  image_recipe_arn                 = aws_imagebuilder_image_recipe.this.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.this.arn

  depends_on = [
    data.aws_iam_policy_document.image_builder,
    aws_imagebuilder_image_recipe.this,
    aws_imagebuilder_distribution_configuration.this,
    aws_imagebuilder_infrastructure_configuration.this
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

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_imagebuilder_component.cw_agent
  ]
}
