provider "aws" {
    access_key = "AKIA5HKJ3TX7YPTXNRWE"
    secret_key = "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"
    region = "ap-south-1"
}
terraform {
  required_version = "<= 1.1.2" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 3.0.0" #Forcing which version of plugin needs to be used.
      source = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "default" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "TERRA-VPC"
	Owner = "tarun"
    }
}