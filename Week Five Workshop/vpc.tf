resource "aws_vpc" "vpc_01" {
  cidr_block = "10.0.0.0/16"
 

   tags = {
    Name="vpc_01"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_01.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id  
  }

  tags = {
    Name = "public-route-table"
  }
}
