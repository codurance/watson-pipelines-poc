# resource "azurerm_linux_web_app" "payroll" {
#   name                = "${local.prefix}-payroll"
#   location            = local.main_resource_group_location
#   resource_group_name = local.main_resource_group_name
#   service_plan_id     = local.main_service_plan_id

#   site_config {
#     application_stack {
#       docker_image     = "${local.main_container_registry_login_server}/${var.payroll_docker_image_name}"
#       docker_image_tag = var.payroll_docker_image_tag
#     }
#   }

#   app_settings = {
#     "DOCKER_REGISTRY_SERVER_URL" : local.main_container_registry_login_server
#     "DOCKER_REGISTRY_SERVER_USERNAME" : local.main_container_registry_admin_username
#     "DOCKER_REGISTRY_SERVER_PASSWORD" : local.main_container_registry_admin_password
#     "EMPLOYEES_URL_PROTOCOL" : var.employees_url_protocol
#     "EMPLOYEES_URL_HOST" : azurerm_linux_web_app.employees.default_hostname
#     "EMPLOYEES_URL_PORT" : var.employees_url_port
#   }
# }

# resource "azurerm_app_service_virtual_network_swift_connection" "vnintegrationconnection" {
#   app_service_id = azurerm_linux_web_app.payroll.id
#   subnet_id      = local.main_integration_subnet_id
# }

resource "azurerm_linux_web_app" "employees" {
  name                = "${local.prefix}-employees"
  location            = local.main_resource_group_location
  resource_group_name = local.main_resource_group_name
  service_plan_id     = local.main_service_plan_id

  site_config {
    application_stack {
      docker_image     = "${local.main_container_registry_login_server}/${var.employees_docker_image_name}"
      docker_image_tag = var.employees_docker_image_tag
    }
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" : local.main_container_registry_login_server
    "DOCKER_REGISTRY_SERVER_USERNAME" : local.main_container_registry_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" : local.main_container_registry_admin_password
  }
}

resource "azurerm_private_endpoint" "privateendpoint" {
  name                = "${local.prefix}-private-endpoint"
  location            = local.main_resource_group_location
  resource_group_name = local.main_resource_group_name
  subnet_id           = local.main_endpoint_subnet_id

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
