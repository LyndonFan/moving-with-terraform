resource "aws_vpc" "internal_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "PrivateVPC"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.internal_vpc.id

  tags = {
    Name = "Main Internet Gateway"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.internal_vpc.id
  cidr_block = "10.0.1.0/24"
  
  tags = {
    Name = "Private Subnet"
  }
}