resource "azurerm_service_plan" "sp" {
  name                = "${local.prefix}-sp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "payroll" {
  name                = "${local.prefix}-payroll"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {
    application_stack {
      docker_image     = "${azurerm_container_registry.cr.login_server}/${var.payroll_docker_image_name}"
      docker_image_tag = var.payroll_docker_image_tag
    }
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" : azurerm_container_registry.cr.login_server
    "DOCKER_REGISTRY_SERVER_USERNAME" : azurerm_container_registry.cr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" : azurerm_container_registry.cr.admin_password
    "EMPLOYEES_URL_PROTOCOL" : var.employees_url_protocol
    "EMPLOYEES_URL_HOST" : azurerm_linux_web_app.employees.default_hostname
    "EMPLOYEES_URL_PORT" : var.employees_url_port
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnintegrationconnection" {
  app_service_id = azurerm_linux_web_app.payroll.id
  subnet_id      = azurerm_subnet.integration.id
}

resource "azurerm_linux_web_app" "employees" {
  name                = "${local.prefix}-employees"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {
    application_stack {
      docker_image     = "${azurerm_container_registry.cr.login_server}/${var.employees_docker_image_name}"
      docker_image_tag = var.employees_docker_image_tag
    }
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" : azurerm_container_registry.cr.login_server
    "DOCKER_REGISTRY_SERVER_USERNAME" : azurerm_container_registry.cr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" : azurerm_container_registry.cr.admin_password
  }
}

resource "azurerm_private_endpoint" "privateendpoint" {
  name                = "${local.prefix}-private-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.endpoint.id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnsprivatezone.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_linux_web_app.employees.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
