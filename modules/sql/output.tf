output "sql_server_name" {
  value       = azurerm_mssql_server.sqlserver.name
  description = "SQL Server name"
}

output "sql_server_fqdn" {
  value       = azurerm_mssql_server.sqlserver.fully_qualified_domain_name
  description = "SQL Server fully qualified domain name"
}

output "sql_database_name" {
  value       = azurerm_mssql_database.sqldb.name
  description = "SQL Database name"
}
