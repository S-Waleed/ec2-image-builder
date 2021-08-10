resource "aws_imagebuilder_image" "this" {
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.this.arn
  image_recipe_arn                 = aws_imagebuilder_image_recipe.this.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.this.arn

  depends_on = [
    data.aws_iam_policy_document.image_builder
  ]
}
