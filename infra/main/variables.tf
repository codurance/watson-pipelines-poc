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

variable "address_space" {
  type        = list(string)
  description = "The address space of the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "integration_sub_address_prefixes" {
  type        = list(string)
  description = "The address prefixes of the integration subnet."
  default     = ["10.0.1.0/24"]
}

variable "endpoint_sub_address_prefixes" {
  type        = list(string)
  description = "The address prefixes of the endpoint subnet."
  default     = ["10.0.100.0/24"]
}

variable "private_dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone. Must be a valid domain name."
  default     = "privatelink.azurewebsites.net"
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
