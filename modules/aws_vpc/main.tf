resource "aws_vpc" "ponimauuu" {
    cidr_block = var.CIDR
    tags = {
        Name=var.name
    }
}

resource "aws_internet_gateway" "ponimau-igw" {
  vpc_id = aws_vpc.ponimauuu.id
  tags = {
    Name = "${var.name}_igw"
  }
}

resource "aws_eip" "elastic_ip" {
    domain = "vpc"
  tags = {
    Name = "${var.name}_eip"
  }
}

resource "aws_subnet" "pon_public" {
    vpc_id = aws_vpc.ponimauuu.id
    cidr_block = var.public_cidr
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.name}_public"
    }
}

resource "aws_subnet" "pon_private" { 
    vpc_id = aws_vpc.ponimauuu.id
    cidr_block = var.private_cidr 
    tags = {
        Name = "${var.name}_private"
    }
}

resource "aws_route_table" "public_tb" {
  vpc_id = aws_vpc.ponimauuu.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ponimau-igw.id
  }
  tags = {
    Name = "${var.name}_route"
  }
}

resource "aws_route_table" "private_tb" {
    vpc_id = aws_vpc.ponimauuu.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ponimau_nat.id
        }
        tags = {
          Name = "${var.name}_route_prvt"
        }
    }
  
resource "aws_nat_gateway" "ponimau_nat" {
    allocation_id = aws_eip.elastic_ip.id
    subnet_id = aws_subnet.pon_public.id
    tags = {
        Name = "${var.name}_nat"
    }  
}

resource "aws_route_table_association" "public_as" {
    subnet_id = aws_subnet.pon_public.id
    route_table_id = aws_route_table.public_tb.id
}

resource "aws_route_table_association" "private_as" {
    subnet_id = aws_subnet.pon_private.id
  route_table_id = aws_route_table.private_tb.id
}