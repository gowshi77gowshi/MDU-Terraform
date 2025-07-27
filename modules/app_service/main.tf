resource "azurerm_service_plan" "appplan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_windows_web_app" "webapp" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appplan.id

  site_config {
    always_on = var.always_on
    vnet_route_all_enabled = true
     
   

    application_stack {
      current_stack  = var.stack
      dotnet_version = var.dotnet_version
    }
  }

  app_settings = var.app_settings
  https_only   = var.https_only
  tags         = var.tags
 virtual_network_subnet_id = var.subnet_id

 
 
}

