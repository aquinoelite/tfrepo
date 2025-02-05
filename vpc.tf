terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "tfvpcnoel" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tfvpcnoel"
  }
}

resource "aws_subnet" "tfsubnet" {
  vpc_id                  = aws_vpc.tfvpcnoel.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.tfvpcnoel]

  tags = {
    Name = "tfsubnet"
  }
}
