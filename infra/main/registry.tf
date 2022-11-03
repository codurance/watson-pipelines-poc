resource "azurerm_container_registry" "cr" {
  name                = "${var.environment}${var.project}cr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
}