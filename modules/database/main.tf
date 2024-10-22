# Creating the SQL server
resource "azurerm_mssql_server" "sql_server" {
  name                          = "${var.sql_server_name}-${var.random_string}"
  resource_group_name           = var.rgname
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.admin_username
  administrator_login_password  = var.admin_password
  public_network_access_enabled = false
  minimum_tls_version           = "1.2"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_mssql_server_extended_auditing_policy" "auditing_policy" {
  server_id                               = azurerm_mssql_server.sql_server.id
  storage_endpoint                        = var.storage_blob_endpoint
  storage_account_access_key              = var.storage_account_access_key
  storage_account_access_key_is_secondary = true
  retention_in_days                       = 100
}

resource "azurerm_mssql_database" "sql_database" {
  name         = "${var.sql_database_name}-${var.random_string}"
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    environment = var.environment
  }

  # prevent the possibility of accidental data loss
  #lifecycle {
  #  prevent_destroy = true
  # }
}


