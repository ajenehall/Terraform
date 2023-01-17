output "peering-connection-id" {
  description = "The ID of the peering connection"
  value = aws_vpc_peering_connection.main.id
}