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
