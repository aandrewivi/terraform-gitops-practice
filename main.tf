# provider definition
# This file contains the provider definition for AWS
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.96.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}



# vpc definition
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "drift-lab-vpc"
  }

}

# subnet definition
# This file contains the subnet definition for the VPC
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-east-1a"


  tags = {
    Name = "drift-lab-subnet"
  }

}

# Security group definition
# This file contains the security group definition for allowing SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  # ingress rule to allow SSH access
  # This rule allows inbound traffic on port 22 (SSH) from any IP address
  ingress {
    from_port   = var.security_group_ingress_description
    to_port     = var.security_group_ingress_description
    protocol    = "tcp"
    cidr_blocks = [var.security_group_cidr_block]
  }


  # egress rule to allow all outbound traffic
  # This rule allows all outbound traffic from the instance
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drift-lab-sg"
  }

}


# EC2 instance definition
resource "aws_instance" "drift-lab-instance" {
  ami                         = var.ami_id # Amazon Linux 2 AMI
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = "drift-lab-instance"
  }

}











