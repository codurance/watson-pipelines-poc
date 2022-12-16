resource "azurerm_container_group" "employees" {
  name                = "${local.prefix}-aci-employees"
  resource_group_name = local.main.resource_group.name
  location            = local.main.resource_group.location
  ip_address_type     = "Private"
  os_type             = "Linux"
  restart_policy      = "OnFailure"

  image_registry_credential {
    server   = local.main.container_registry.server
    username = local.main.container_registry.username
    password = local.main.container_registry.password
  }

  container {
    name   = "employees"
    image  = "${local.main.container_registry.server}/employees:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 4567
      protocol = "TCP"
    }
  }

  container {
    name   = "sidecar"
    image  = "${local.main.container_registry.server}/sidecar:latest"
    cpu    = "0.5"
    memory = "1.5"

    environment_variables = {
      "ACI_INSTANCE_NAME" : "${local.prefix}-aci-employees"
      "RESOURCE_GROUP" : local.main.resource_group.name
      "A_RECORD_NAME" : "${local.prefix}-employees"
      "DNS_ZONE_NAME" : local.main.dns_zone_name
    }

    secure_environment_variables = {
      "APP_ID" : var.client_id
      "APP_PASSWORD" : var.client_secret
      "APP_TENANT_ID" : var.tenant_id
    }
  }

  subnet_ids = [local.main.subnet_id]
}

# resource "azurerm_container_group" "payroll" {
#   name                = "${local.prefix}-aci-payroll"
#   resource_group_name = var.resource_group_name
#   location            = local.location
#   ip_address_type     = "Private"
#   os_type             = "Linux"

#   image_registry_credential {
#     server   = var.container_registry.server
#     username = var.container_registry.username
#     password = var.container_registry.password
#   }

#   container {
#     name   = "payroll"
#     image  = "${var.container_registry.server}/payroll:latest"
#     cpu    = "0.5"
#     memory = "1.5"

#     ports {
#       port     = 4567
#       protocol = "TCP"
#     }

#     environment_variables = {
#       EMPLOYEES_URL_HOST = azurerm_container_group.employees.ip_address
#     }
#   }

#   subnet_ids = [azurerm_subnet.backend.id]
# }

# resource "azurerm_subnet" "frontend" {
#   name                 = "${local.prefix}-sub-frontend"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.virtual_network_name
#   address_prefixes     = var.frontend_address_prefixes
# }

# resource "azurerm_public_ip" "pip" {
#   name                = "${local.prefix}-pip"
#   resource_group_name = var.resource_group_name
#   location            = local.location
#   allocation_method   = "Dynamic"
# }

# resource "azurerm_application_gateway" "gtw" {
#   name                = "${local.prefix}-gtw"
#   resource_group_name = var.resource_group_name
#   location            = var.location

#   sku {
#     name     = "Standard_Small"
#     tier     = "Standard"
#     capacity = 1
#   }

#   gateway_ip_configuration {
#     name      = "${local.prefix}-gtw-ip-config"
#     subnet_id = azurerm_subnet.frontend.id
#   }

#   frontend_port {
#     name = local.frontend_port_name
#     port = 80
#   }

#   frontend_ip_configuration {
#     name                 = local.frontend_ip_configuration_name
#     public_ip_address_id = azurerm_public_ip.pip.id
#   }

#   backend_address_pool {
#     name         = local.backend_address_pool_name
#     ip_addresses = [azurerm_container_group.payroll.ip_address]
#   }

#   backend_http_settings {
#     name                  = local.backend_http_settings_name
#     cookie_based_affinity = "Disabled"
#     port                  = 4567
#     protocol              = "Http"
#     request_timeout       = 30
#     probe_name            = local.custom_probe_name
#   }

#   http_listener {
#     name                           = "${local.prefix}-gtw-http-lst"
#     frontend_ip_configuration_name = local.frontend_ip_configuration_name
#     frontend_port_name             = local.frontend_port_name
#     protocol                       = "Http"
#   }

#   request_routing_rule {
#     name                       = "${local.prefix}-gtw-req-rou"
#     rule_type                  = "Basic"
#     http_listener_name         = local.listener_name
#     backend_address_pool_name  = local.backend_address_pool_name
#     backend_http_settings_name = local.backend_http_settings_name
#   }

#   probe {
#     name                = local.custom_probe_name
#     host                = azurerm_container_group.payroll.ip_address
#     protocol            = "Http"
#     path                = "/payroll/1"
#     interval            = 30
#     timeout             = 30
#     unhealthy_threshold = 3
#     match {
#       status_code = [200]
#     }
#   }
# }