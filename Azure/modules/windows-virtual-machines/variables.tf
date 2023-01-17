variable "windows-vm-name" {
  description = "Name of a windows virtual machine"
  type = list(string)
}

variable "resource-group-name" {
  description = "Resource Group Name"
  type = list(string)
}

variable "resource-group-location" {
  description = "Region in which Azure Resources to be created"
  type = list(string) 
}

variable "subnet-id" {
  description = "Id of a subnet"
  type = list(string)
}

variable "vm-size" {
  description = "Size of the virtual machine"
  type = string
}

variable "admin-user" {
  description = "Admin user of the virtual machine"
  type = string
}

variable "admin-password" {
  description = "Admin password of the virtual machine"
  type = string
}

variable "os-disk-caching" {
  description = "OS disk caching option"
  type = string
}

variable "os-disk-storage" {
  description = "OS disk storage account type option"
  type = string
}

variable "image-publisher" {
  description = "The publisher for the image"
  type = string
}

variable "image-offer" {
  description = "The offer for the image"
  type = string
}

variable "image-sku" {
  description = "The sku for the image"
  type = string
}

variable "image-version" {
  description = "The version for the image"
  type = string
}