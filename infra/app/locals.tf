locals {
  prefix                                 = "${var.environment}-${var.project}"
  main_resource_group_location           = data.terraform_remote_state.trs.outputs.resource_group_location
  main_resource_group_name               = data.terraform_remote_state.trs.outputs.resource_group_name
  main_service_plan_id                   = data.terraform_remote_state.trs.outputs.service_plan_id
  main_container_registry_login_server   = data.terraform_remote_state.trs.outputs.container_registry_login_server
  main_container_registry_admin_username = data.terraform_remote_state.trs.outputs.container_registry_admin_username
  main_container_registry_admin_password = data.terraform_remote_state.trs.outputs.container_registry_admin_password
  main_integration_subnet_id             = data.terraform_remote_state.trs.outputs.integration_subnet_id
  main_endpoint_subnet_id                = data.terraform_remote_state.trs.outputs.endpoint_subnet_id
  main_private_dns_zone_id               = data.terraform_remote_state.trs.outputs.private_dns_zone_id
}
