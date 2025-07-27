resource "azurerm_application_insights" "appinsights" {
  name                = "appi-${var.project}-${var.env}-${var.location}-${var.instance}"
  location            = var.location
  resource_group_name = var.rg_name
  application_type    = var.application_type
  retention_in_days   = var.retention_in_days
  sampling_percentage = var.sampling_percentage
  disable_ip_masking  = var.disable_ip_masking
  local_authentication_disabled = var.local_authentication_disabled

  tags                = var.tags

}