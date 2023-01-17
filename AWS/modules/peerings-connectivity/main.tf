resource "aws_route" "main" {
  count = length(var.route-table-id)
  route_table_id = var.route-table-id[count.index]
  destination_cidr_block = var.destination-cidr[count.index]
  vpc_peering_connection_id = var.peering-connection-id
}