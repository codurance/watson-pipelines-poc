data "terraform_remote_state" "jrs" {
    backend = "local"

    config = {
        path = var.jenkins_remote_state
    }
}

