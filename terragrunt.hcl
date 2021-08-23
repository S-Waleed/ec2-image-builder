 remote_state {
   backend = "s3"
   config = {
     bucket  = "your-bucket-prefix-${path_relative_to_include()}-tf-state"
     key     = "${path_relative_to_include()}/image-builder/terraform.tfstate"
     region  = ""
     profile = ""
     encrypt = true
   }
 }
