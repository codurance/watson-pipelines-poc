output "resource_group_location" {
  description = "The Resource Group Location."
  value       = azurerm_resource_group.rg.location
}

output "resource_group_name" {
  description = "The Resource Group Name."
  value       = azurerm_resource_group.rg.name
}

output "container_registry_login_server" {
  description = "The Container Registry login server endpoint."
  value       = azurerm_container_registry.cr.login_server
}

output "container_registry_admin_username" {
  description = "The Container Registry admin username."
  value       = azurerm_container_registry.cr.admin_username
}

output "container_registry_admin_password" {
  description = "The Container Registry admin password."
  value       = azurerm_container_registry.cr.admin_password
  sensitive   = true
}
