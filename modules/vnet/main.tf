resource "azurerm_virtual_network" "virtualnetwork" {
  name                = "vnet-${var.project}-${var.env}-${var.location}-${var.instance}"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
  
}

resource "azurerm_subnet" "static_web" {
  name                 = "subnet-staticweb-${var.project}-${var.env}-${var.location}-${var.instance}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
  address_prefixes     = var.subnet_staticweb_prefixes


}

resource "azurerm_subnet" "app_service" {
  name                 = "subnet-appsvc-${var.project}-${var.env}-${var.location}-${var.instance}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
  address_prefixes     = var.subnet_appsvc_prefixes

delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.Web/serverFarms"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }

}

resource "azurerm_subnet" "sql" {
  name                 = "subnet-sql-${var.project}-${var.env}-${var.location}-${var.instance}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
  address_prefixes     = var.subnet_sql_prefixes
}

resource "azurerm_subnet" "apim" {
  name                 = "subnet-apim-${var.project}-${var.env}-${var.location}-${var.instance}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
  address_prefixes     = var.subnet_apim_prefixes
}
