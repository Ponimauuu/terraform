resource "aws_db_instance" "remote_db" {
  allocated_storage   = 20
  db_name            = var.db_name
  engine              = var.eng
  engine_version       = "15.4"
  instance_class       = var.class
  username             = var.user
  password             = var.passwd
  availability_zone = var.az
  skip_final_snapshot  = true
  publicly_accessible = true
  tags = {
    Name = var.name
  }
}