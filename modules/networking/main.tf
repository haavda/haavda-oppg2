#Creating the Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.rgname
}

#Creating the Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

#Creating the Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

#Creating the Subnet-NSG association
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

data "http" "my_public_ip" {
  url = "http://ipv4.icanhazip.com"
}

#Creating the network security rule
resource "azurerm_network_security_rule" "ssh" {
  name                        = "SSH-Flexible-IP"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "22"
  destination_port_range      = "22"
  source_address_prefix       = trimspace(data.http.my_public_ip.response_body)
  destination_address_prefix  = "*"
  resource_group_name         = var.rgname
  network_security_group_name = azurerm_network_security_group.nsg.name
}