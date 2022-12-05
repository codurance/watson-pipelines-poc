resource "azurerm_private_endpoint" "vmprivateendpoint" {
  name                = "${local.prefix}-vm-private-endpoint"
  location            = local.main_resource_group_location
  resource_group_name = local.main_resource_group_name
  subnet_id           = local.main_vm_subnet_id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [local.main_private_dns_zone_id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_linux_web_app.employees.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
