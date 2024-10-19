# Output the SQL Server ID
output "sql_server_id" {
  value       = azurerm_mssql_server.sql_server.id
  description = "The ID of the SQL Server"
}

# Output the SQL Server FQDN (Fully Qualified Domain Name)
output "sql_server_fqdn" {
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
  description = "The Fully Qualified Domain Name (FQDN) of the SQL Server"
}

# Output the SQL Server Name
output "sql_server_name" {
  value       = azurerm_mssql_server.sql_server.name
  description = "The name of the SQL Server"
}

# Output the SQL Database ID
output "sql_database_id" {
  value       = azurerm_mssql_database.sql_database.id
  description = "The ID of the SQL Database"
}

# Output the SQL Database Name
output "sql_database_name" {
  value       = azurerm_mssql_database.sql_database.name
  description = "The name of the SQL Database"
}