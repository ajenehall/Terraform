variable "resource-group-name" {
  description = "Resource Group Name"
  type = string
}

variable "resource-group-location" {
  description = "Region in which Azure Resources to be created"
  type = string
}

variable "virtual-wan-name" {
  description = "Name of the virtual wan"
  type = string
}

variable "virtual-wan-type" {
  description = "Type of the virtual wan"
  type = string
}

variable "virtual-hub-name" {
  description = "Name of the virtual hub"
  type = string
}

variable "virtual-hub-sku" {
  description = "Sku for the virtual hub"
  type = string
}

variable "virtual-hub-address-prefix" {
    description = "Address prefix for the virtual hub"
    type = string
}

variable "virtual-hub-connection-name" {
  description = "ID of the virtual hub connection"
  type = list(string)
}

variable "virtual-hub-connection-vnet-id" {
  description = "ID of remote virtual network"
  type = list(string)
}