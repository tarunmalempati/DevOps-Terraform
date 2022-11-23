#Launch an EC2 instance

provider "aws" {
  region     = "ap-south-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "ap-south-1" {
  ami           = "ami-0d8633ffb1a5574db"
  instance_type = "t2.micro"
}
