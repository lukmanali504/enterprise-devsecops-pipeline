provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "secure_sg" {

  name        = "secure-security-group"
  description = "Secure Security Group"

  ingress {

    description = "Restricted SSH Access"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["3.108.42.229/32"]
  }

  egress {

    description = "HTTPS Outbound"

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "secure-sg"
  }
}

resource "aws_instance" "dummy_instance" {

  ami           = "ami-07a00cf47dbbc844c"

  instance_type = "t3.micro"

  monitoring = true

  ebs_optimized = true

  metadata_options {

    http_tokens = "required"

    http_endpoint = "enabled"
  }

  root_block_device {

    encrypted = true
  }

  iam_instance_profile = "LabInstanceProfile"

  vpc_security_group_ids = [
    aws_security_group.secure_sg.id
  ]

  tags = {
    Name = "dummy-instance"
  }
}
