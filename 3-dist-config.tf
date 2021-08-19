resource "aws_imagebuilder_distribution_configuration" "this" {
  name = "local-distribution"

  distribution {
    ami_distribution_configuration {
    }
    region = var.aws_region
  }
}
