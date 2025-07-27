resource "azurerm_storage_account" "storage" {
  name = lower("stg${var.project}${var.env}${var.instance}")

  # name                     = "stg${var.project}${var.env}${var.location}${var.instance}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  # enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version          = var.min_tls_version
  access_tier              = var.access_tier
  # allow_blob_public_access = var.allow_blob_public_access
  tags                     = var.tags
}

