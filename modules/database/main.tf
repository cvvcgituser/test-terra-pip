resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = var.db_name
  username               = var.db-instance_username
  password               = var.db-instance_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.db_sg]
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.db-subnet-group_name}"
  subnet_ids = [var.db-subnet-1, var.db-subnet-2]

  tags = {
    Name = "${var.db-subnet-group_nametag}"
  }
}
