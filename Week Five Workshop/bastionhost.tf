resource "aws_instance" "bastion" {
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_01_b.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion-host"
  }

  key_name = "rds" 
}
