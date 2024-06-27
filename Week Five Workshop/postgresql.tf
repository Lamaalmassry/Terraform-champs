
resource "aws_db_instance" "postgresql" {
  identifier              = "postgresqldatabase"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "15.4"
  username                = "postgres"
  password                = "lama__592000"
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group_01.name
  vpc_security_group_ids  = [aws_security_group.sg_01.id]
  skip_final_snapshot     = true
 
  tags = {
    Name = "postgresqldatabase"
  }
 
}