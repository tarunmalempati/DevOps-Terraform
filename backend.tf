terraform {
  backend "s3" {
    bucket = "bucket_name"
    key = " terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}
