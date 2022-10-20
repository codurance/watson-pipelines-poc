data "terraform_remote_state" "jrs" {

    backend = "azurerm"

    config = {
        resource_group_name  = "dev-watson-rg-jenkins-tfstate"
        storage_account_name = "devwatsontfstatesa"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}
