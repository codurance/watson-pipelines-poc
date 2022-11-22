terraform {
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = "terraform.tfstate"
  }
}

data "terraform_remote_state" "trs" {

  backend = "azurerm"

  config = {
    resource_group_name  = var.main_remote_state_resource_group_name
    storage_account_name = var.main_remote_state_storage_account_name
    container_name       = var.main_remote_state_container_name
    key                  = "terraform.tfstate"
  }
}
