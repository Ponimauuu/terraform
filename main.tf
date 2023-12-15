provider "aws" {}

terraform {
  backend "s3" {
    bucket = "terraform-ponimau" 
    key    = "terraform.tfstate"             
    region = "us-east-1"                                 
  }
}

module "vpc" {
    source = "./modules/aws_vpc"
}

module "sg" {
    source = "./modules/aws_sg"
    id_vpc = module.vpc.id_vpc
}

module "ec2" {
    source = "./modules/aws_ec2"
    secure = module.sg.SG_id_pub
    secure_prvt = module.sg.SG_id_prv
    private_id = module.vpc.private
    public_id = module.vpc.public
    counts = var.counts
    instance_type = var.instance_type
}

module "rds" {
  source = "./modules/aws_rds"
  user = var.user
  passwd = var.passwd
}