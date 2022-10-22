resource "azurerm_subnet" "sub" {
  name                 = "${local.prefix}-sub"
  resource_group_name  = local.jenkins_rg_name
  virtual_network_name = local.jenkins_vn_name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "pip" {
  name                = "${local.prefix}-pip"
  resource_group_name = local.jenkins_rg_name
  location            = local.jenkins_rg_location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "${local.prefix}-nic"
  location            = local.jenkins_rg_location
  resource_group_name = local.jenkins_rg_name

  ip_configuration {
    name                          = "${local.prefix}-public"
    subnet_id                     = azurerm_subnet.sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}
