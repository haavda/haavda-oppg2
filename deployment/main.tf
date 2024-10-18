terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend-haavda"  
    storage_account_name = "sabackend3nb27xoogv"  
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
  name     = "${var.rg_name}-${random_string.random_string.result}"
  location = var.location
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

#The Network Module
module "networking" {
  source     = "./modules/networking"
  rgname     = azurerm_resource_group.rg.name
  location   = azurerm_resource_group.rg.location
  //TODO
}

module "app_service" {
  source = "./modules/app_service"
  rgname     = azurerm_resource_group.rg.name
  location   = azurerm_resource_group.rg.location
  //TODO
}

module "database" {
  source = "./modules/database"
  rgname     = azurerm_resource_group.rg.name
  location   = azurerm_resource_group.rg.location
  //TODO
}

module "storage" {
  source = "./modules/storage"
  rgname     = azurerm_resource_group.rg.name
  location   = azurerm_resource_group.rg.location
  //TODO
}



