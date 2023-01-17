variable "resource-group-name" {
  description = "Resource Group Name"
  type = string
}

variable "resource-group-location" {
  description = "Region in which Azure Resources to be created"
  type = string
}

variable "lb-name" {
  description = "Name of the load balancer"
  type = string
}

variable "lb-sku" {
  description = "Type of sku of the load balancer"
  type = string
  default = "Standard"
}

variable "lb-frontend-ip-name" {
  description = "The name of the front end IP address"
  type = string
}

variable "lb-frontend-ip-subnet-id" {
  description = "Subnet id to place the front end IP address"
  type = string
}

variable "private-ip-address-allocation" {
  description = "Type of IP address allocation"
  type = string
  default = "Dynamic"
}

variable "pool-name" {
  description = "Name of the back end pool"
  type = string
}

variable "pool-member-names" {
  description = "Names of the pool members"
  type = list(string)
}

variable "pool-member-ip-address" {
  description = "IP Addresses of the pool members"
  type = list(string)
}

variable "vnet-id" {
  description = "Virtual network id"
  type = string
}

variable "lb-rule-name" {
  description = "Name of the load balancer rule"
  type = string
}

variable "lb-rule-protocol" {
  description = "Protocol to use for the load balancer rule"
  type = string
}

variable "lb-rule-frontend-port" {
  description = "Front end port that receives client requests"
  type = string
}

variable "lb-rule-backend-port" {
  description = "Back end port that sends server requests"
  type = string
}

variable "lb-probe-name" {
  description = "Name of the load balancer health probe"
  type = string
}

variable "lb-probe-port" {
  description = "Port of the health probe"
  type = number
}

variable "lb-probe-protocol" {
  description = "Protocol of the health probe"
  type = string
}