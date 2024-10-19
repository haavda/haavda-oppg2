#Creating the Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = "${var.saname}${var.random_string}"
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#Creating the Storage Container
resource "azurerm_storage_container" "sc" {
  name                  = var.scname
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}