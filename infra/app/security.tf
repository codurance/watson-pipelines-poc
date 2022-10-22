resource "azurerm_network_security_group" "sg" {
  name                = "${local.prefix}-sg"
  location            = local.jenkins_rg_location
  resource_group_name = local.jenkins_rg_name

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  subnet_id                 = azurerm_subnet.sub.id
  network_security_group_id = azurerm_network_security_group.sg.id
}
