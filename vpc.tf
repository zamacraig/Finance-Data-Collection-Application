resource "aws_vpc" "finance_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "finance"
  }
}


resource "aws_vpc_endpoint" "sns_endpoint" {
  vpc_id            = aws_vpc.finance_vpc.id
  service_name      = var.sns_servicename
  vpc_endpoint_type = "Interface"
  subnet_ids        = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]

  security_group_ids = [
    aws_security_group.sg_private.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "private_vpc_endpoint"
  }
}
