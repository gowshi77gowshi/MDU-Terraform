resource "azurerm_api_management" "apim" {
  name                = "apim-${var.project}-${var.env}-${var.location}-${var.instance}"
  location            = var.location
  resource_group_name = var.rg_name

  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email

  sku_name            = var.sku_name



  identity {
    type = var.identity_type
  }

  tags = var.tags
}
