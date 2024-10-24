terraform {
  backend "azurerm" {
    resource_group_name  = "rg-backend-haavda"
    storage_account_name = "sabackenddz0y2pebg3"
    container_name       = "sc-backend-haavda"
    key                  = "dev.oblig2.terraform.tfstate"
  }
}
