output "app_service_plan_id" {
  value = azurerm_service_plan.appplan.id
}

output "web_app_id" {
  value = azurerm_windows_web_app.webapp.id
}

output "web_app_default_hostname" {
  value = azurerm_windows_web_app.webapp.default_hostname
}
