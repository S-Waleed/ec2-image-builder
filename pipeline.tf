resource "aws_imagebuilder_image_pipeline" "this" {
  image_recipe_arn                 = aws_imagebuilder_image_recipe.this.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.this.arn
  name                             = "amazon-linux-baseline"

  schedule {
    schedule_expression = "cron(0 9 ? * thu)"
    # This cron expressions states every Thursday at 9 AM.
  }
}
