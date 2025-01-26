resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.finance_vpc.id
  cidr_block = var.private_finance_subnet_a_cidr
  availability_zone = var.vpc_zone_1

  tags = {
    Name = "Private Subnet A"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id     = aws_vpc.finance_vpc.id
  cidr_block = var.private_finance_subnet_b_cidr
  availability_zone = var.vpc_zone_2

  tags = {
    Name = "Private Subnet B"
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.finance_vpc.id
  cidr_block = var.public_finance_subnet_a_cidr
  availability_zone = var.vpc_zone_1

  tags = {
    Name = "Public Subnet A"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.finance_vpc.id
  cidr_block = var.public_finance_subnet_b_cidr
  availability_zone = var.vpc_zone_2

  tags = {
    Name = "Public Subnet B"
  }
}

resource "aws_db_subnet_group" "private_subnet_group" {
  name       = "private_subnet_group"
  subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]

  tags = {
    Name = "private_subnet_group"
  }
}

resource "aws_db_subnet_group" "public_subnet_group" {
  name       = "public_subnet_group"
  subnet_ids = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]

  tags = {
    Name = "public_subnet_group"
  }
}