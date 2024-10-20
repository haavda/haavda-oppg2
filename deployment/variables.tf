variable "rgname" {
  type        = string
  description = "The resource group name"
}

variable "location" {
  type        = string
  description = "location"
}

variable "environment" {
  type        = string
  description = "The environment name (dev, staging, prod)"
}

#Variables for the networking module
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

#Variables for the storage module
variable "saname" {
  type        = string
  description = "The name of the Storage Account"
}

variable "scname" {
  type        = string
  description = "The name of the Storage Container"
}

#Variables for the app_service module
variable "service_plan_name" {
  type        = string
  description = "The name of the service plan"
}

#Variables for the database module
variable "sql_server_name" {
  type        = string
  description = "Name of the sql server"
}

variable "sql_database_name" {
  type        = string
  description = "Name of the sql database"
}

variable "admin_username" {
  type        = string
  description = "The admin username"
}

variable "admin_password" {
  type        = string
  description = "The admin password"
  sensitive   = true
}

#Variables for the load_balancer module
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