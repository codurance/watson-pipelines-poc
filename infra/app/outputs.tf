output "employees_app_svc_default_hostname" {
  description = "The default hostname of the Employees App Service."
  value       = azurerm_linux_web_app.employees.default_hostname
}
