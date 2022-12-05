locals {
  prefix                                 = "${var.environment}-${var.project}"
  main_resource_group_name               = var.resource_group_name
  main_resource_group_location           = var.resource_group_location
  main_service_plan_id                   = var.service_plan_id
  main_container_registry_login_server   = var.container_registry_login_server
  main_container_registry_admin_username = var.container_registry_admin_username
  main_container_registry_admin_password = var.container_registry_admin_password
  main_endpoint_subnet_id                = var.endpoint_subnet_id
  main_vm_subnet_id                      = var.vm_subnet_id
  main_private_dns_zone_id               = var.private_dns_zone_id
}
