resource "azurerm_mssql_server" "sqlserver" {
  name = lower("sqlsrv-${var.project}-${var.env}-${var.instance}")
  # name                         = "sqlsrv-${var.project}-${var.env}-${var.location}-${var.instance}"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.sql_admin_user
  administrator_login_password = var.sql_admin_password
  minimum_tls_version          = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}

resource "azurerm_mssql_database" "sqldb" {
  name               = "sqldb-${var.project}-${var.env}-${var.location}-${var.instance}"
  server_id          = azurerm_mssql_server.sqlserver.id
  collation          = var.collation
  license_type       = var.license_type
  max_size_gb        = var.max_size_gb
  sku_name           = var.sql_sku_name
  zone_redundant     = var.zone_redundant
  read_scale         = var.read_scale

  tags = var.tags
}

# Private DNS Zone for SQL
resource "azurerm_private_dns_zone" "sql_dns" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.rg_name
}

# Link DNS zone to VNET
resource "azurerm_private_dns_zone_virtual_network_link" "sql_dns_link" {
  name                  = "sql-vnet-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_dns.name
  virtual_network_id    = var.vnet_id
}

# Private Endpoint for SQL Server
resource "azurerm_private_endpoint" "sql_pe" {
  name                = "pe-sql-${var.env}-${var.instance}"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.sql_subnet_id

  private_service_connection {
    name                           = "psc-sql-${var.env}-${var.instance}"
    private_connection_resource_id = azurerm_mssql_server.sqlserver.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "sql-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.sql_dns.id]
  }

  tags = var.tags
}
