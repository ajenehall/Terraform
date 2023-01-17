variable "vpc-id" {
  description = "ID of a VPC"
  type = string
}

variable "subnet-id" {
  description = "ID of a public subnet"
  type = list(string)
}

variable "internet-gateway-name" {
  description = "Name of an internet gateway"
  type = list(string)
}

variable "route-table-id" {
  description = "ID of a route table"
  type = list(string)
}