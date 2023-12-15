variable "user" {}

variable "passwd" {}

variable "class" {
    default = "db.t3.micro"
}

variable "eng"{
    default = "postgres"
}

variable "name" {
    default = "ponimau"
}

variable "az" {
    default = "us-east-1a"
}

variable "db_name" {
    default = "ponimaudb"
}