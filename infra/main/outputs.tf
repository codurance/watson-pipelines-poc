output "service_plan_id" {
  description = "The ID of the App Service plan."
  value       = azurerm_service_plan.sp.id
}

output "container_registry_login_server" {
  description = "The Container Registry login server endpoint."
  value       = azurerm_container_registry.cr.login_server
}

output "container_registry_admin_username" {
  description = "The Container Registry admin username."
  value       = azurerm_container_registry.cr.admin_username
  sensitive   = true
}

output "container_registry_admin_password" {
  description = "The Container Registry admin password."
  value       = azurerm_container_registry.cr.admin_password
  sensitive   = true
}

output "endpoint_subnet_id" {
  description = "The endpoint subnet ID."
  value       = azurerm_subnet.endpoint.id
}

output "vm_subnet_id" {
  description = "The vm subnet ID."
  value       = azurerm_subnet.vm_sub.id
}

output "private_dns_zone_id" {
  description = "The private DNS zone ID."
  value       = azurerm_private_dns_zone.dnsprivatezone.id
}
