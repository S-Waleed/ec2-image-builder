resource "aws_imagebuilder_distribution_configuration" "this" {
  name = "local-distribution"

  distribution {
    ami_distribution_configuration {

      # description = "Built with Image Builder"
      # ami_tags = {
      #   Name  = "${var.ami_name_tag}-v${var.image_receipe_version}"
      #   # Owner = "Waleed"
      # }

      # name = "amazon-linux2-{{ imagebuilder:buildDate }}"

      # launch_permission {
      #   user_ids = ["376874005367"]
      # }
    }
    region = var.aws_region
  }
}
