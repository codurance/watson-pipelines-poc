variable "environment" {
  type        = string
  description = "The environment name."
}

variable "project" {
  type        = string
  description = "The project name."
}

variable "subscription_id" {
  type        = string
  description = "The Azure account subscription id."
}

variable "client_id" {
  type        = string
  description = "The Azure Service Principal client id."
}

variable "client_secret" {
  type        = string
  description = "The Azure Service Principal client secret."
}

variable "tenant_id" {
  type        = string
  description = "The Azure Service Principal tenant id."
}

# variable "employees_url_protocol" {
#   type        = string
#   description = "The protocol used to connect to the Employees service."
#   default     = "http"
# }

# variable "employees_url_port" {
#   type        = string
#   description = "The port used to connect to the Employees service."
#   default     = "80"
# }

variable "employees_docker_image_name" {
  type        = string
  description = "The Employees service container name."
  default     = "employees"
}

variable "employees_docker_image_tag" {
  type        = string
  description = "The Employees service container tag."
  default     = "latest"
}

##########################################
# We will later get the below variables
# from the remote state of the main infra
##########################################

# variable "main_remote_state_resource_group_name" {
#   type        = string
#   description = "The resource group name where the remote state storage account lives."
# }

# variable "main_remote_state_storage_account_name" {
#   type        = string
#   description = "The storage account name of the remote state."
# }

# variable "main_remote_state_container_name" {
#   type        = string
#   description = "The container name where the remote state lives."
# }

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "resource_group_location" {
  type        = string
  description = "The resource group location."
}

variable "service_plan_id" {
  type        = string
  description = "The service plan ID from the main infra."
}

variable "container_registry_login_server" {
  type        = string
  description = "The container registry login server from the main infra."
}

variable "container_registry_admin_username" {
  type        = string
  description = "The container registry admin username from the main infra."
}

variable "container_registry_admin_password" {
  type        = string
  description = "The container registry admin password from the main infra."
}

variable "endpoint_subnet_id" {
  type        = string
  description = "The endpoint subnet id from the main infra."
}

variable "vm_subnet_id" {
  type        = string
  description = "The vm subnet id from the main infra."
}

variable "private_dns_zone_id" {
  type        = string
  description = "The the private dns zone id from the main infra."
}
