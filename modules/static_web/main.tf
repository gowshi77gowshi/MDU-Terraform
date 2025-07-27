resource "azurerm_static_web_app" "web_app" {
  name                = "stapp-${var.project}-${var.env}-${var.location}-${var.instance}"
  resource_group_name = var.rg_name
  location            = "eastus2"
  sku_tier            = var.sku_tier
  
   tags                = var.tags
}

