locals {
  prefix              = "${var.environment}-${var.project}"
  jenkins_rg_location = data.terraform_remote_state.jrs.outputs.rg_location
  jenkins_rg_name     = data.terraform_remote_state.jrs.outputs.rg_name
  jenkins_vn_name     = data.terraform_remote_state.jrs.outputs.vn_name
}
