data "terraform_remote_state" "jrs" {

    backend = "azurerm"

    config = {
        resource_group_name  = var.jenkins_remote_state_resource_group_name
        storage_account_name = var.jenkins_remote_state_storage_account_name
        container_name       = var.jenkins_remote_state_container_name
        key                  = "terraform.tfstate"
    }
}
