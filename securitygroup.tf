resource "aws_security_group" "sg_private" {
  name        = "private_security_group"
  description = "Allow traffic only from vpc"
  vpc_id      = aws_vpc.finance_vpc.id

  tags = {
    Name = "Private Security Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_private_allow_db_port" {
  security_group_id = aws_security_group.sg_private.id
  cidr_ipv4         = aws_vpc.finance_vpc.cidr_block
  from_port         = var.db_port
  ip_protocol       = "tcp"
  to_port           = var.db_port
}

resource "aws_vpc_security_group_egress_rule" "sg_private_allow_vpc_traffic" {
  security_group_id = aws_security_group.sg_private.id
  cidr_ipv4         = aws_vpc.finance_vpc.cidr_block
  ip_protocol       = "-1"
}

resource "aws_security_group" "sg_public" {
  name        = "public_security_group"
  description = "Allow traffic only from vpc"
  vpc_id      = aws_vpc.finance_vpc.id

  tags = {
    Name = "Public Security Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_public_allow_https_port" {
  security_group_id = aws_security_group.sg_public.id
  cidr_ipv4         = var.internet_cidr
  from_port         = var.http_port
  ip_protocol       = "tcp"
  to_port           = var.http_port
}

resource "aws_vpc_security_group_egress_rule" "sg_public_allow_vpc_traffic" {
  security_group_id = aws_security_group.sg_public.id
  cidr_ipv4         = var.internet_cidr
  ip_protocol       = "-1"
}