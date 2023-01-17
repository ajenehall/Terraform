variable "resource-group-name" {
  description = "Resource Group Name"
  type = string
}

variable "resource-group-location" {
  description = "Region in which Azure Resources to be created"
  type = string
}

variable "vnet-name" {
  description = "Name of a virtual network"
  type = string
}

variable "route-server-subnet-prefix" {
  description = "Prefix for the subnet for route server"
  type = string
}

variable "route-server-public-ip-name" {
  description = "Name of the public ip for route server"
  type = string
}

variable "public-ip-allocation" {
  description = "Allocation method for the public ip"
  type = string
}

variable "public-ip-sku" {
  description = "Sku for the public ip"
  type = string
}

variable "route-server-name" {
  description = "Name of the route server"
  type = string
}

variable "route-server-sku" {
  description = "Sku of the route server"
  type = string
}

variable "route-server-branch" {
  description = "Enables route exchange between route server and the gateway"
  type = bool
}