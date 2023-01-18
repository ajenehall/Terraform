variable "private-dns-zone-name" {
  description = "Name of the private dns zone"
  type = string
}

variable "resource-group-name" {
  description = "Name of the resource group"
  type = string
}

variable "network-link-name" {
  description = "Name of the private dns zone virtual network link"
  type = string
}

variable "virtual-network-id" {
  description = "ID of the virtual network"
  type = string
}

variable "registration" {
  description = "Enable or disable dns registration for a virtual network"
  type = bool
}