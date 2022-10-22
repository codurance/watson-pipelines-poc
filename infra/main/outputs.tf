output "public_ip_address" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "vn_name" {
  value = azurerm_virtual_network.vn.name
}
