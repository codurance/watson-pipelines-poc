module "employees" {
  source = "./modules/container"

  prefix             = local.prefix
  resource_group     = local.main.resource_group
  subnet_id          = local.main.subnet_id
  dns_zone_name      = local.main.dns_zone_name
  container_registry = local.main.container_registry

  # TODO: use managed identity instead of managing another service principal
  client_id     = var.client_id
  client_secret = var.client_secret
  tenant_id     = var.tenant_id

  name              = "employees"
  docker_image_name = "employees"
  ports = [{
    number   = 4567
    protocol = "TCP"
  }]
}

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
