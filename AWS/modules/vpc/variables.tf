variable "vpc-cidr-block" {
  description = "The IPv4 CIDR block for the VPC"
  type = string
}

variable "vpc-name" {
  description = "Name of the VPC"
  type = string
}

variable "subnet-name" {
  description = "Name of the subnet"
  type = list(string)
}

variable "subnet-cidr-block" {
  description = "The IPv4 CIDR block for the subnet"
  type = list(string)
}

variable "availability-zone" {
  description = "The name of the availability zone"
  type = string
}