resource "aws_vpc_peering_connection" "main" {
  peer_vpc_id = var.peer-vpc-id
  vpc_id = var.vpc-id
  auto_accept = true

  tags = {
    Name = var.peering-connection-name
  }
}

resource "aws_route" "main" {
  count = length(var.route-table-id)
  route_table_id = var.route-table-id[count.index]
  destination_cidr_block = var.destination-cidr[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}