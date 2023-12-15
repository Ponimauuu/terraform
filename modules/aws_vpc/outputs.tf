output "id_vpc" {
    value = aws_vpc.ponimauuu.id
}
output "cidr_vpc" {
    value = aws_vpc.ponimauuu.cidr_block
}
output "public" {
    value = aws_subnet.pon_public.id
}
output "private" {
    value = aws_subnet.pon_private.id
}