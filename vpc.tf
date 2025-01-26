resource "aws_vpc" "finance_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "finance"
  }
}