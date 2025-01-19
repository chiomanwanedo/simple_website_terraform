provider "aws" {
  region = "eu-west-2"  # Change to your preferred region
}

resource "aws_instance" "web_server" {
  ami           = "ami-03715fb51899253c4"  # Amazon Linux 2 AMI ID (Update based on region)
  instance_type = "t2.micro"

  key_name      = var.key_pair_name
  security_groups = [aws_security_group.web_sg.name]

  user_data = file("userdata.sh")

  tags = {
    Name = "SimpleWebServer"
  }
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
