resource "aws_instance" "helloworld" {
  ami           = "ami-033adaf0b583374d4"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform In Action"
  }
}
