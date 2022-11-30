variable "environment" {
  type        = string
  description = "The environment name."
}

variable "project" {
  type        = string
  description = "The project name."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "resource_group_location" {
  type        = string
  description = "The resource group location."
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
