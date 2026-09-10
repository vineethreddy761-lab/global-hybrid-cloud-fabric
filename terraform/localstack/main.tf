resource "aws_vpc" "public_cloud_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "BettingPlatform-PublicVPC"
    Environment = "Local-Simulation"
  }
}

output "vpc_id" {
  value = aws_vpc.public_cloud_vpc.id
}
