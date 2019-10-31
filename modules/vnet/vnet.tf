# Creating Virtual Network

resource "azurerm_resource_group" "mstest" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "mstest" {
  name = "virtual-${azurerm_resource_group.mstest.name}"
  location = var.location
  resource_group_name = azurerm_resource_group.mstest.name
  address_space = [var.address_space]
}

resource "azurerm_subnet" "publicsubnet" {
  address_prefix = var.public_address_prefix
  name = var.public_subnet
  resource_group_name = azurerm_resource_group.mstest.name
  virtual_network_name = azurerm_virtual_network.mstest.name
}

resource "azurerm_subnet" "privatesubnet" {
  address_prefix = var.private_address_prefix
  name = var.private_subnet
  resource_group_name = azurerm_resource_group.mstest.name
  virtual_network_name = azurerm_virtual_network.mstest.name
}

resource "azurerm_subnet_network_security_group_association" "nsg-public-association" {
  network_security_group_id = azurerm_network_security_group.public-nsg.id
  subnet_id = azurerm_subnet.publicsubnet.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-private-association" {
  network_security_group_id = azurerm_network_security_group.private-nsg.id
  subnet_id = azurerm_subnet.privatesubnet.id
}