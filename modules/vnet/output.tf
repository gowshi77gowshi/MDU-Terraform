output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.virtualnetwork.id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.virtualnetwork.name
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value = {
    static_web = azurerm_subnet.static_web.id
    app_service = azurerm_subnet.app_service.id
    sql = azurerm_subnet.sql.id
    apim = azurerm_subnet.apim.id
  }
}
