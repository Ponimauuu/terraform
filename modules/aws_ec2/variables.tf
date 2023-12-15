variable "instance_type" {
    default = "t2.nano"  
}
variable "secure" {}
variable "public_id" {}
variable "private_id" {}
variable "secure_prvt" {}

variable "counts" {
    default = 1
}

variable "name_prvt" {
    default = "Ponimau-private"
}

variable "name_pub" {
    default = "Ponimau-bastion"
}

variable "ami_ubuntu" {
    default = "ami-0fc5d935ebf8bc3bc"
}