variable "peer-vpc-id" {
  description = "VPC ID of the peer"
  type = string
}

variable "vpc-id" {
  description = "VPC ID"
  type = string
}

variable "peering-connection-name" {
  description = "Name of the peering connection"
  type = string
}

# variable "peering-connection-id" {
#   description = "The ID of the peering connection"
#   type = string
# }

variable "route-table-id" {
  description = "ID of a routing table"
  type = list(string)
}

variable "destination-cidr" {
  description = "Destination CIDR to be use in a route for the peering connection"
  type = list(string)
}