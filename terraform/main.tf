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
  region = "us-east-1"
}

module "vpc_landing_zone" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  environment = "production"
}

output "vpc_id" {
  description = "The ID of the deployed hybrid cloud VPC"
  value       = module.vpc_landing_zone.vpc_id
}
