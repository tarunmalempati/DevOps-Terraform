
resource "aws_instance" "app_server" {
  ami           = "ami-00ff962d94b87fe06"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
