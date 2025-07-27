output "instrumentation_key" {
  description = "Instrumentation Key for the App Insights instance"
  value       = azurerm_application_insights.appinsights.instrumentation_key
}

output "app_id" {
  description = "App Insights App ID"
  value       = azurerm_application_insights.appinsights.app_id
}

output "appinsights_name" {
  description = "Name of the App Insights instance"
  value       = azurerm_application_insights.appinsights.name
}
