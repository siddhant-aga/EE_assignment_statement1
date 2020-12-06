# Public Route table for IGW
resource "aws_route_table" "public-subnet-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Subnet-Route-Table"
  }
}

# Private Route Table for NAT
resource "aws_route_table" "private-subnet-rt" {
  vpc_id = aws_vpc.vpc.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "Private-Subnet-Route-Table"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public-rt-association" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-subnet-rt.id
}

# Assign the route table to the private Subnet
resource "aws_route_table_association" "private-rt-association" {
  subnet_id = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-subnet-rt.id
}