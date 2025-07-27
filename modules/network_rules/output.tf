output "nsg_id" {
  description = "Network Security Group ID"
  value       = azurerm_network_security_group.networkrules.id
}

output "nsg_name" {
  description = "NSG Name"
  value       = azurerm_network_security_group.networkrules.name
}
