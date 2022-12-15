locals {
  prefix = "${var.environment}-${var.project}"

  main = {
    resource_group = {
      location = data.terraform_remote_state.trs.outputs.resource_group_location
      name     = data.terraform_remote_state.trs.outputs.resource_group_name
    }

    container_registry = {
      server   = data.terraform_remote_state.trs.outputs.container_registry_login_server
      username = data.terraform_remote_state.trs.outputs.container_registry_admin_username
      password = data.terraform_remote_state.trs.outputs.container_registry_admin_password
    }

    subnet_id     = data.terraform_remote_state.trs.outputs.subnet_id
    dns_zone_name = data.terraform_remote_state.trs.outputs.dns_zone_name
  }
}
