# Create Route Table
resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.finance_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.finance_igw.id
  }

  tags = {
    Name = "public_subnet_route_table"
  }
}

# Associate Route Table with Public Subnet A
resource "aws_route_table_association" "public_subnet_a_association" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}

# Associate Route Table with Public Subnet B
resource "aws_route_table_association" "public_subnet_b_association" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}

# Create routes between private subnet and public subnet
resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.finance_vpc.id

  tags = {
    Name = "private_subnet_route_table"
  }
}

# Associate Route Table with Private Subnet
resource "aws_route_table_association" "private_subnet_a_association" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}

# Associate Route Table with Private Subnet
resource "aws_route_table_association" "private_subnet_b_association" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}