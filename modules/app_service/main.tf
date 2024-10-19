#Creating the service plan
resource "azurerm_service_plan" "service_plan" {
  name                = "${var.service_plan_name}-${var.random_string}"
  resource_group_name = var.rgname
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}