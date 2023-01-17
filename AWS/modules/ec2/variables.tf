variable "key-pair-name" {
  description = "Name of the key pair used for the ec2 instance"
  type = string
}

variable "key-pair-rsa-bits" {
  description = "RSA bit length to use for the private key"
  type = number
}

variable "key-pair-algorithm" {
  description = "Algorithm to use for the private key"
  type = string
}

variable "security-group-name" {
  description = "Name of the security group"
  type = string
}

variable "vpc-id" {
  description = "ID of the VPC, where the security group belongs"
  type = string
}

variable "windows-instance-type" {
  description = "EC2 instance type for Windows Server"
  type        = string
}

variable "windows-associate-public-ip-address" {
  description = "Associate a public IP address to the EC2 instance"
  type        = bool
  default     = true
}

variable "windows-root-volume-size" {
  description = "Size of the root volume of Windows Server"
  type        = number
  default     = "30"
}

variable "windows-data-volume-size" {
  description = "Size of the data volume of Windows Server"
  type        = number
  default     = "10"
}

variable "windows-root-volume-type" {
  description = "Type of root volume of Windows Server"
  type        = string
  default     = "gp2"
}

variable "windows-data-volume-type" {
  description = "Type of data volume of Windows Server"
  type        = string
  default     = "gp2"
}

variable "windows-instance-name" {
  description = "EC2 instance name for Windows Server"
  type        = list(string)
}

variable "subnet-id" {
  description = "Subnet ID for network connectivity"
  type = list(string)
}