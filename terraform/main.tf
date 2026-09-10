terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

resource "aws_vpc" "global_hybrid_vpc" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "GlobalHybrid-MigrationFabric-VPC"
    Environment = "Hybrid-Simulation"
  }
}

resource "aws_subnet" "public_edge_subnet" {
  vpc_id            = aws_vpc.global_hybrid_vpc.id
  cidr_block        = "10.100.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-Edge-Subnet"
  }
}

output "vpc_id" {
  value = aws_vpc.global_hybrid_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_edge_subnet.id
}
