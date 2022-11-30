resource "azurerm_subnet" "bastion_sub" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.bastion_sub_address_prefixes
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = "${local.prefix}-bastion-pip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "${local.prefix}-bastion"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "${local.prefix}-bastion-conf"
    subnet_id            = azurerm_subnet.bastion_sub.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}
