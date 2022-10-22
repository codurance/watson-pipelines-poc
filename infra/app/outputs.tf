output "public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}
