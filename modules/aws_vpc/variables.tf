variable "CIDR" {
    default = "10.0.0.0/16"
}
variable "public_cidr" {
    default = "10.0.1.0/24" 
}
variable "private_cidr" {
    default = "10.0.10.0/24"
}

variable "name" {
    default = "ponimau"
}