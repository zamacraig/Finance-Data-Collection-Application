resource "aws_internet_gateway" "finance_igw" {
  vpc_id = aws_vpc.finance_vpc.id

  tags = {
    Name = "Finance Internet Gateway"
  }
}
