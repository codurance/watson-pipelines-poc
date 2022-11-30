resource "azurerm_container_registry" "cr" {
  name                = replace("${local.prefix}-cr", "-", "")
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_service_plan" "sp" {
  name                = "${local.prefix}-sp"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_virtual_network" "vn" {
  name                = "${local.prefix}-vn"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "integration" {
  name                 = "${local.prefix}-integration-sub"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.integration_sub_address_prefixes

  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
}

resource "azurerm_subnet" "endpoint" {
  name                                      = "${local.prefix}-endpoint-sub"
  resource_group_name                       = var.resource_group_name
  virtual_network_name                      = azurerm_virtual_network.vn.name
  address_prefixes                          = var.endpoint_sub_address_prefixes
  private_endpoint_network_policies_enabled = false
}

resource "azurerm_private_dns_zone" "dnsprivatezone" {
  name                = "${local.prefix}.azurewebsites.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelink" {
  name                  = "${local.prefix}-dns-zone-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dnsprivatezone.name
  virtual_network_id    = azurerm_virtual_network.vn.id
}
