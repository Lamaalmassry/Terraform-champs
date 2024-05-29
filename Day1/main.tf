provider "aws" {
  region     = "us-east-1"
  }


# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "vpc-1"
    Environment = "terraformChamps"
    Owner       = "lama"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name        = "igw-1"
    Environment = "terraformChamps"
    Owner       = "lama"
  }
}

# Create Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name        = "subnet-1"
    Environment = "terraformChamps"
    Owner       = "lama"
  }
}

# Create Route Table
resource "aws_route_table" "my_rtable" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name        = "rtable-1"
    Environment = "terraformChamps"
    Owner       = "lama"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "my_rtable_ass" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_rtable.id
}







