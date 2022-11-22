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
  description = "The Azure account subscribtion id."
}

variable "main_remote_state_resource_group_name" {
  type        = string
  description = "The resource group name where the remote state storage account lives."
}

variable "main_remote_state_storage_account_name" {
  type        = string
  description = "The storage account name of the remote state."
}

variable "main_remote_state_container_name" {
  type        = string
  description = "The container name where the remote state lives."
}

variable "employees_url_protocol" {
  type        = string
  description = "The protocol used to connect to the Employees service."
  default     = "http"
}

variable "employees_url_port" {
  type        = string
  description = "The port used to connect to the Employees service."
  default     = "80"
}

variable "payroll_docker_image_name" {
  type        = string
  description = "The Payroll service container name."
  default     = "payroll"
}

variable "payroll_docker_image_tag" {
  type        = string
  description = "The Payroll service container tag."
  default     = "latest"
}

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
