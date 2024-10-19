variable "saname" {
  type        = string
  description = "The name of the Storage Account"
}

variable "scname" {
  type        = string
  description = "The name of the Storage Container"
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