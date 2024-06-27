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
   tags = {
    Name = "subnet_01_b"
  }
}



resource "aws_db_subnet_group" "rds_subnet_group_01" {
  subnet_ids = [aws_subnet.subnet_01_a.id , aws_subnet.subnet_01_b.id]

  tags = {
   Name ="rds_subnet_group_01"
  }
}
