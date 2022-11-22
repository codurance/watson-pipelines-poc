resource "azurerm_resource_group" "rg" {
  name     = "${local.prefix}-rg"
  location = "UK South"
}

resource "azurerm_virtual_network" "vn" {
  name                = "${local.prefix}-vn"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
}

resource "azurerm_subnet" "integration" {
  name                 = "${local.prefix}-integration-sub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.integration_sub_address_prefixes

  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }
}

resource "azurerm_subnet" "endpoint" {
  name                                      = "${local.prefix}-endpoint-sub"
  resource_group_name                       = azurerm_resource_group.rg.name
  virtual_network_name                      = azurerm_virtual_network.vn.name
  address_prefixes                          = var.endpoint_sub_address_prefixes
  private_endpoint_network_policies_enabled = false
}

resource "azurerm_private_dns_zone" "dnsprivatezone" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelink" {
  name                  = "${local.prefix}-dns-zone-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dnsprivatezone.name
  virtual_network_id    = azurerm_virtual_network.vn.id
}
