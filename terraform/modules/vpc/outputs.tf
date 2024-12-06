output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "route_table_id" {
  value = aws_route_table.my_route_table.id
}

output "igw_id" {
  value = aws_internet_gateway.my_igw.id
}
