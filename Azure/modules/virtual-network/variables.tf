variable "resource-group-name" {
  description = "Resource Group Name"
  type = string
}

variable "resource-group-location" {
  description = "Region in which Azure Resources to be created"
  type = string
}

variable "vnet-name" {
  description = "Name of virtual network"
  type = string
}

variable "vnet-address-space" {
  description = "Address space to use for a virtual network"
  type = list(string)
}

variable "subnet-name" {
  description = "Name of subnet"
  type = list(string)
}

variable "subnet-address-prefix" {
  description = "Address prefix to use for a subnet"
  type = list(string)
}