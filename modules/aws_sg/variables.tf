variable "id_vpc" {}
variable "port" {
    default = ["80","443","22","5432"]
}

variable "name_public" {
    default = "ponimau-sg-pub"
}

variable "name_privte" {
    default = "ponimau-sg-prvt"
}