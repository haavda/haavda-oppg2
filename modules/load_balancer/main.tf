# Creating a public IP address for the Load Balancer
resource "azurerm_public_ip" "public_ip_lb" {
  name                = "${var.public_ip_lb_name}-${var.random_string}"
  location            = var.location
  resource_group_name = var.rgname
  allocation_method   = "Static"

  tags = {
    environment = var.environment
  }
}

# Creating the Load Balancer
resource "azurerm_lb" "lb" {
  name                = "${var.lb_name}-${var.random_string}"
  location            = var.location
  resource_group_name = var.rgname 

  frontend_ip_configuration {
    name                 = var.fip_conf_name
    public_ip_address_id = azurerm_public_ip.public_ip_lb.id
  }

  tags = {
    environment = var.environment
  }
}