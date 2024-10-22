variable "rgname" {
  type        = string
  description = "The resource group name"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "service_plan_name" {
  type        = string
  description = "The name of the service plan"
}

variable "random_string" {
  type        = string
  description = "Random string for unique names"
}

variable "web_app_name" {
  type        = string
  description = "Name of the web app"
}