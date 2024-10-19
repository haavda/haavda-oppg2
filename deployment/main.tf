terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend-haavda"
    storage_account_name = "sabackenddz0y2pebg3"
    container_name       = "sc-backend-haavda"
    key                  = "oblig2.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "a3adf20e-4966-4afb-b717-4de1baae6db1"
  features {
  }
}

# Resource Group for all resources
resource "azurerm_resource_group" "rg" {
  name     = "${var.rgname}-${random_string.random_string.result}"
  location = var.location
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

#The Network Module
module "networking" {
  source     = "../modules/networking"
  rgname     = azurerm_resource_group.rg.name
  location   = azurerm_resource_group.rg.location
  nsgname    = var.nsgname
  vnetname   = var.vnetname
  subnetname = var.subnetname
}

#The app_service module
module "app_service" {
  source            = "../modules/app_service"
  rgname            = azurerm_resource_group.rg.name
  location          = azurerm_resource_group.rg.location
  service_plan_name = var.service_plan_name
  random_string     = random_string.random_string.result
}

#The Database module
module "database" {
  source            = "../modules/database"
  rgname            = azurerm_resource_group.rg.name
  location          = azurerm_resource_group.rg.location
  sql_server_name   = var.sql_server_name
  sql_database_name = var.sql_database_name
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  random_string     = random_string.random_string.result
  environment       = var.environment
}

# The Storage Module
module "storage" {
  source        = "../modules/storage"
  rgname        = azurerm_resource_group.rg.name
  location      = azurerm_resource_group.rg.location
  saname        = var.saname
  scname        = var.scname
  random_string = random_string.random_string.result
}




