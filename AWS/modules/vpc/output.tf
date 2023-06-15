output "vpc-id" {
  description = "ID of a VPC"
  value = aws_vpc.main[*].id
}

output "subnet-id" {
  description = "ID of a subnet"
  value = aws_subnet.main[*].id
}

# output "subnet-cidr" {
#   description = "Subnet CIDR block"
#   value = aws_subnet.main[*].cidr_block
# }

output "route-table-id" {
  description = "ID of a route table"
  value = aws_route_table.main[*].id
}

output "default-security-group-id" {
  description = "ID of the default security group of the vpc"
  value = aws_vpc.main[*].default_security_group_id
}