variable "resource-group-name" {
  description = "Resource Group Name"
  type = string
}

variable "peer-spoke-name" {
  description = "Peering connection from vnet to another vnet"
  type = string
}

variable "peer-hub-name" {
  description = "Peering connection to vnet from another vnet"
  type = string
}

variable "vnet-spoke-name" {
  description = "Virtual network name"
  type = string
}

variable "vnet-hub-name" {
  description = "Virtual network name"
  type = string
}

variable "remote-spoke-vnet-id" {
  description = "Remote virtual network name"
  type = string
}

variable "remote-hub-vnet-id" {
  description = "Remote virtual network name"
  type = string
}

variable "allow-forwarded-traffic-spoke" {
  description = "Setting for the configuration of allowing forwarded traffic"
  type = bool
}

variable "allow-forwarded-traffic-hub" {
  description = "Setting for the configuration of allowing forwarded traffic"
  type = bool
}

variable "use-remote-gateways-spoke" {
  description = "Controls if remote gateways or route server can be used on the local virtual network"
  type = bool
}

variable "use-remote-gateways-hub" {
  description = "Controls if remote gateways or route server can be used on the local virtual network"
  type = bool
}

variable "allow-gateway-transit-spoke" {
  description = "Controls if gateway links can be used in the remote virtual network's link to the local virtual network"
  type = bool
}

variable "allow-gateway-transit-hub" {
  description = "Controls if gateway links can be used in the remote virtual network's link to the local virtual network"
  type = bool
}