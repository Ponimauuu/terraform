resource "aws_instance" "private-instance" {
  count = var.counts
  ami           = var.ami_ubuntu
  instance_type = var.instance_type
  subnet_id     = var.private_id
  security_groups = [var.secure_prvt]
  tags = {
    Name = "${var.name_prvt}_${count.index + 1}"
  }
}

resource "aws_instance" "public-instance" {
  ami           = var.ami_ubuntu
  instance_type = var.instance_type
  subnet_id     = var.public_id
  security_groups = [var.secure]
  tags = {
    Name = var.name_pub
  }
}