resource "aws_imagebuilder_distribution_configuration" "example" {
  name = "example"

  distribution {
    ami_distribution_configuration {
      ami_tags = {
        CostCenter = "IT"
      }

      name = "example-{{ imagebuilder:buildDate }}"

      launch_permission {
        user_ids = ["123456789012"]
      }
    }

    region = "us-east-1"
  }
}
