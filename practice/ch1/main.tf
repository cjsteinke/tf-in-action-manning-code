provider "aws" {
  profile = "terraform-user"
}

resource "aws_instance" "HelloAlma" {
  ami             = "ami-08b29382556696ac9"
  instance_type   = "t2.micro"

  tags = {
    Name  = "helloalma"
    Email = "chrisjsteinke@gmailcom"
  }
}
