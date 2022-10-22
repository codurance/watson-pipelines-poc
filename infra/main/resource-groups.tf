resource "azurerm_resource_group" "rg" {
  name     = "${local.prefix}-rg"
  location = "UK South"
}
