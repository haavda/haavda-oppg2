output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "The name of the storage account"
}

output "storage_container_name" {
  value       = azurerm_storage_container.sc.name
  description = "The name of the storage container"
}

output "storage_connection_string" {
  value       = azurerm_storage_account.sa.primary_connection_string
  description = "The connection string of the storage account"
}