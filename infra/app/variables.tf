variable "environment" {
  type = string
  description = "The environment name."
}

variable "project" {
  type = string
  description = "The project name."
}

variable "subscription_id" {
  type = string
  description = "The Azure account subscribtion id."
}

variable "admin_password" {
  type = string
  description = "The VM admin password."
}

variable "main_remote_state_resource_group_name" {
  type = string
  description = "The resource group name where the remote state storage account lives."
}

variable "main_remote_state_storage_account_name" {
  type = string
  description = "The storage account name of the remote state."
}

variable "main_remote_state_container_name" {
  type = string
  description = "The container name where the remote state lives."
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes of the VM subnet."
  default     = ["10.0.10.0/24"]
}

variable "vm_size" {
  type        = string
  description = "The SKU which should be used for the Virtual Machine, such as Standard_F2."
  default     = "Standard_D2s_v3"
}

variable "vm_admin_username" {
  type        = string
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  default     = "adminuser"
}

variable "vm_disk_caching" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  default     = "ReadWrite"
}

variable "vm_disk_storage_type" {
  type        = string
  description = "The Storage Account Type of the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created."
  default     = "Standard_LRS"
}

variable "vm_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machine."
  default     = "canonical"
}

variable "vm_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machine."
  default     = "0001-com-ubuntu-server-jammy"
}

variable "vm_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machine."
  default     = "22_04-lts-gen2"
}

variable "vm_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machine."
  default     = "latest"
}
