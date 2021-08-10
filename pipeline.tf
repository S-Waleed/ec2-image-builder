resource "aws_imagebuilder_image_pipeline" "this" {
  image_recipe_arn                 = aws_imagebuilder_image_recipe.this.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.this.arn
  name                             = "amazon-linux-baseline"
  status                           = "ENABLED"
  description                      = "Creates an Amazon Linux 2 image."

  schedule {
    schedule_expression = "cron(0 8 ? * tue)"
    # This cron expressions states every Tuesday at 8 AM.
    pipeline_execution_start_condition = "EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE"
  }

  # Test the image after build
  image_tests_configuration {
    image_tests_enabled = true
    timeout_minutes     = 60
  }

  tags = {
    "Name" = "${var.ami_name_tag}-pipeline"
  }
}
