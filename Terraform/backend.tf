terraform {
  backend "s3" {
    bucket = "demob117"
    key    = "terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}
