output "vpc_id" {
  value = module.vpc.id_vpc
}

output "private_subnet_id" {
    value = module.vpc.private 
}

output "public_subnet_id" {
    value = module.vpc.public
}

output "public" {
    value =module.ec2.bast_ip
}

output "prvt" {
   value = module.ec2.private_ip
}

output "rds_db_id" {
    value = module.rds.db_id
}