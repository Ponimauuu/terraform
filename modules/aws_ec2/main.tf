data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
resource "aws_instance" "private-instance" {
  count = var.counts
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.private_id
  security_groups = [var.secure_prvt]
  tags = {
    Name = "${var.name_prvt}_${count.index + 1}"
  }
}

resource "aws_instance" "public-instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_id
  security_groups = [var.secure]
  tags = {
    Name = var.name_pub
  }
}