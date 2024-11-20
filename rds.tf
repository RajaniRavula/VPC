# RDS Instance
resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.36"
  instance_class       = "db.t3.micro"
  db_name              = "three_tier_db"  # Correct argument name
  username             = "admin"
  password             = "password123"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true # Avoids creating a final snapshot
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = aws_subnet.private.*.id
  tags = {
    Name = "DB-Subnet-Group"
  }
}