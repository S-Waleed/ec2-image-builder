resource "aws_imagebuilder_image_pipeline" "example" {
  image_recipe_arn                 = aws_imagebuilder_image_recipe.example.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.example.arn
  name                             = "example"

  schedule {
    schedule_expression = "cron(0 0 * * ? *)"
  }
}
