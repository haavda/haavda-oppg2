variable "public_ip_lb_name" {
  type = string
  description = "Name of the Public IP of the LB"
}

variable "lb_name" {
  type = string
  description = "Name of the Load Balancer"
}

variable "fip_conf_name" {
  type = string
  description = "Name of the frontend ip configuration"
}

variable "environment" {
  type        = string
  description = "The environment name (dev, staging, prod)"
}

variable "rgname" {
  type        = string
  description = "The resource group name"
}

variable "location" {
  type        = string
  description = "location"
}

variable "random_string" {
  type        = string
  description = "Random string for unique names"
}