resource "azurerm_service_plan" "sp" {
  name                = "${local.prefix}-sp"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = "Linux"
  sku_name            = "B1"
}
