data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                            = "kv-${var.project}-${var.env}-${var.location}-${var.instance}"
  location                        = var.location
  resource_group_name             = var.rg_name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = var.kv_sku_name
  # soft_delete_enabled             = var.kv_soft_delete_enabled
  purge_protection_enabled        = var.kv_purge_protection_enabled
  enabled_for_deployment          = var.kv_enabled_for_deployment
  enabled_for_disk_encryption     = var.kv_enabled_for_disk_encryption
  enabled_for_template_deployment = var.kv_enabled_for_template_deployment
  public_network_access_enabled   = var.kv_public_network_access_enabled
  enable_rbac_authorization       = true

   tags                = var.tags
}

resource "azurerm_role_assignment" "keyvault_secrets_app" {
  scope                = azurerm_key_vault.kv.id

  
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.kv_user_object_id
  principal_type       = "ServicePrincipal" 
}


# resource "azurerm_role_assignment" "keyvault_secrets_app" {
#   scope                = azurerm_key_vault.kv.id

  
#   role_definition_name = "Key Vault Secrets User"
#   principal_id         = var.kv_user_object_id
# }


#resource "azurerm_key_vault_access_policy" "ado_pipeline" {
#  key_vault_id = azurerm_key_vault.kv.id
# tenant_id    = data.azurerm_client_config.current.tenant_id
# object_id    = var.kv_user_object_id # Must be a valid SPN object_id

#  secret_permissions = ["Get", "List", "Set"]
#}


# # Get current user/client info
# data "azurerm_client_config" "current" {}

# # Create Key Vault
# resource "azurerm_key_vault" "kv" {
#   name                        = "kv-${var.project}-${var.env}-${var.location}-${var.instance}"
#   location                    = var.location
#   resource_group_name         = var.rg_name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_enabled             = var.kv_soft_delete_enabled
  
#   sku_name                    = "standard"

#   # Required for ADO pipeline integration
#   enable_rbac_authorization   = false
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = true

#   public_network_access_enabled = true

#   tags = var.tags
# }

# # Example: Grant ADO pipeline access (via a service principal)
# resource "azurerm_key_vault_access_policy" "ado_pipeline" {
#   key_vault_id = azurerm_key_vault.kv.id

#   tenant_id = data.azurerm_client_config.current.tenant_id
#   object_id = var.kv_user_object_id # This must be the objectId of the ADO pipeline SPN

#   secret_permissions = [
#     "Get", "List", "Set"
#   ]

