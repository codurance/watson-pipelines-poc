resource "azurerm_resource_group" "rg" {
  name     = "${local.prefix}-rg"
  location = "UK South"
}

resource "azurerm_container_registry" "cr" {
  name                = replace("${local.prefix}-cr", "-", "")
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_service_plan" "sp" {
  name                = "${local.prefix}-sp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
