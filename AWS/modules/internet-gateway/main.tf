# Define internet gateway
resource "aws_internet_gateway" "main" {
  count = length(var.internet-gateway-name)  
  vpc_id = var.vpc-id

  tags = {
    Name = var.internet-gateway-name[count.index]
  }
}

# Define the public route table
# resource "aws_route_table" "main" {
#   count = length(var.internet-gateway-name)  
#   vpc_id = var.vpc-id
# }

# Define route and apply it to a route table
resource "aws_route" "main" {
  count = length(var.internet-gateway-name)  
  # route_table_id = aws_route_table.main[count.index].id
  route_table_id = var.route-table-id[count.index]
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main[count.index].id
}

# # Associate the public route table to the public subnet
# resource "aws_route_table_association" "main" {
#   count = length(var.internet-gateway-name)  
#   subnet_id = var.subnet-id[count.index]
#   route_table_id = aws_route_table.main[count.index].id
# }