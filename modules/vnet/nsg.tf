# NSG applied on Subnet level for public and private subnets

resource "azurerm_network_security_group" "public-nsg" {
  name                = "nsg-public-${azurerm_resource_group.mstest.name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.mstest.name

  security_rule {
    name                       = "nsg-rule-inbound-${azurerm_resource_group.mstest.name}-http-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "nsg-rule-inbound-${azurerm_resource_group.mstest.name}-allow-https"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "nsg-rule-inbound-${azurerm_resource_group.mstest.name}-allow-ssh"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "nsg-rule-outbound-${azurerm_resource_group.mstest.name}-Deny-all"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "private-nsg" {
  name                = "nsg-private-${azurerm_resource_group.mstest.name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.mstest.name

  security_rule {
    name                       = "nsg-rule-inbound-${azurerm_resource_group.mstest.name}-deny-all"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "nsg-rule-outbound-${azurerm_resource_group.mstest.name}-Deny-all"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}