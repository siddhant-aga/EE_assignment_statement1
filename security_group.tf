# Defining security group for master subnet
resource "aws_security_group" "public-sg" {
  name = "public-sg"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public-sg"
  }
}

# Defining security group for private subnet
resource "aws_security_group" "private-sg"{
  name = "private-sg"
  description = "Allow traffic from public subnet"

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private-sg"
  }
}