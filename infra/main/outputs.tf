output "public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "rg_location" {
  description = "The Resource Group Location."
  value       = azurerm_resource_group.rg.location
}

output "rg_name" {
  description = "The Resource Group Name."
  value       = azurerm_resource_group.rg.name
}

output "vn_name" {
  description = "The Virtual Machine name."
  value       = azurerm_virtual_network.vn.name
}
