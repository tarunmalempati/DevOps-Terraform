terraform {
  backend "s3" {
    bucket = "demo"
    key = " terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}
