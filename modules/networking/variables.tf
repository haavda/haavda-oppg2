variable "nsgname" {
  type        = string
  description = "The name of the network security group"
}

variable "vnetname" {
  type        = string
  description = "The name of the virtual network"
}

variable "subnetname" {
  type        = string
  description = "The name of the subnet"
}

variable "rgname" {
  type = string
  description = "The resource group name"
}

variable "location" {
  type = string
  description = "location"
}