
resource "azurerm_container_registry" "cr" {
  name                = replace("${local.prefix}-cr", "-", "")
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Basic"
  admin_enabled       = true
}
