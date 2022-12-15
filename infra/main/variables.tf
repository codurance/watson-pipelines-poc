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

variable "location" {
  type        = string
  default     = "uksouth"
  description = "The Azure location for the resource group."
}

variable "address_space" {
  type        = list(string)
  description = "The address space of the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "sub_address_space" {
  type        = list(string)
  description = "The address prefixes of the subnet."
  default     = ["10.0.0.0/24"]
}
