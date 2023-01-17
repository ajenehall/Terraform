variable "resource-group-name" {
  description = "Resource Group Name"
  type = list(string)
}

variable "resource-group-location" {
  description = "Region in which Azure Resources to be created"
  type = list(string) 
}

variable "bastion-host-name" {
  description = "Name of the bastion host"
  type = list(string)
}

variable "bastion-host-public-ip" {
  description = "Public IP of the bastion host"
  type = list(string) 
}

variable "bastion-public-ip-allocation-method" {
  description = "Allocation method for public ip"
  type = string
}

variable "bastion-public-ip-sku" {
  description = "Sku for public ip"
}

variable "bastion-subnet-name" {
  description = "Name of the bastion subnet"
  type = list(string) 
}

variable "bastion-subnet-prefix" {
  description = "Prefix of the bastion subnet"
  type = list(string)
}

variable "bastion-virtual-network" {
  description = "Name of the virtual network"
  type = list(string)
}