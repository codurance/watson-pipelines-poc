data "terraform_remote_state" "jrs" {

    backend = "azurerm"

    config = {
        resource_group_name  = "dev-watson-infrastate-rg"
        storage_account_name = "devwatsoninfrastatesa"
        container_name       = "dev-watson-jenkins-infrastate"
        key                  = "terraform.tfstate"
    }
}
