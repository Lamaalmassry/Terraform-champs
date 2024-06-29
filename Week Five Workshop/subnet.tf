
resource "aws_subnet" "subnet_01_a" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
   tags = {
    Name = "subnet_01_a"
  }
}

resource "aws_subnet" "subnet_01_b" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
   tags = {
    Name = "subnet_01_b"
  }
}
resource "aws_route_table_association" "subnet_01_b_association" {
  subnet_id      = aws_subnet.subnet_01_b.id
  route_table_id = aws_route_table.public_route_table.id
}



resource "aws_db_subnet_group" "rds_subnet_group_01" {
  subnet_ids = [aws_subnet.subnet_01_a.id , aws_subnet.subnet_01_b.id]

  tags = {
   Name ="rds_subnet_group_01"
  }
}
