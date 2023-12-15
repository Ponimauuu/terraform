resource "aws_security_group" "ponimau_pub" {
  name        = var.name_public
  vpc_id      = var.id_vpc

  dynamic "ingress" {
    for_each = var.port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name_public
  }
}

resource "aws_security_group" "ponimau_prvt" {
  name = var.name_privte
  vpc_id = var.id_vpc
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.name_privte
  }
}