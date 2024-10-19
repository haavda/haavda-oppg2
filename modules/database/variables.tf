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