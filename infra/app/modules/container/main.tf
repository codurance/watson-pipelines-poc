locals {
  name = "${var.prefix}-acg-${var.name}"
}

resource "azurerm_container_group" "acg" {
  name                = local.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  ip_address_type     = "Private"
  os_type             = "Linux"
  restart_policy      = "OnFailure"

  image_registry_credential {
    server   = var.container_registry.server
    username = var.container_registry.username
    password = var.container_registry.password
  }

  container {
    name   = var.name
    image  = "${var.container_registry.server}/${var.docker_image_name}:${var.docker_image_tag}"
    cpu    = var.cpu
    memory = var.memory

    dynamic "ports" {
      for_each = var.ports

      content {
        port     = ports.value.number
        protocol = ports.value.protocol
      }
    }

    environment_variables = var.environment_variables
  }

  container {
    name   = "dns-sidecar"
    image  = "${var.container_registry.server}/${var.dns_sidecar_docker_image_name}:${var.dns_sidecar_docker_image_tag}"
    cpu    = var.dns_sidecar_cpu
    memory = var.dns_sidecar_memory

    environment_variables = {
      "ACI_INSTANCE_NAME" : local.name
      "RESOURCE_GROUP" : var.resource_group.name
      "A_RECORD_NAME" : var.dns_record_name
      "DNS_ZONE_NAME" : var.dns_zone_name
    }

    # TODO: use managed identity instead of managing another service principal
    secure_environment_variables = {
      "APP_ID" : var.client_id
      "APP_PASSWORD" : var.client_secret
      "APP_TENANT_ID" : var.tenant_id
    }
  }

  subnet_ids = [var.subnet_id]
}
