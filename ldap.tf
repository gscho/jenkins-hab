provider "aws" {
  version                 = "1.23.0"
  profile                 = "bluepipeline"
  shared_credentials_file = "~/.aws/credentials"
  region                  = "us-east-1"
}

resource "aws_security_group" "Test-LDAP" {
  name        = "Test-LDAP"
  description = "Test-LDAP"
  vpc_id      = "vpc-3598af4e"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name  = "Test-LDAP"
  }
}

resource "aws_instance" "elasticsearch_master" {
  connection {
    user        = "ubuntu"
    private_key = "${file("./ldap.pem")}"
  }

  key_name                    = "ldap"
  subnet_id                   = "subnet-ba0b87f0"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.Test-LDAP.id}"]
  associate_public_ip_address = true
  ami                         = "ami-a4dc46db"
  availability_zone           = "us-east-1d"

  provisioner "habitat" {
  }

  tags {
    Name  = "Test-LDAP"
  }
}


