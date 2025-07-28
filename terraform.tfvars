# General Configuration
env         = "dev"
# location    = "uksouth"
project     = "Mdunew"
instance    = "0"

# Tags
tags = {
  environment = "dev"
  project     = "mdu"
  owner       = "the-mdu"
}

# VNet
vnet_address_space         = ["10.0.0.0/16"]
subnet_staticweb_prefixes  = ["10.0.1.0/24"]
subnet_appsvc_prefixes     = ["10.0.2.0/24"]
subnet_sql_prefixes        = ["10.0.3.0/24"]
subnet_apim_prefixes       = ["10.0.4.0/24"]

# Key Vault
kv_sku_name                        = "standard"
kv_purge_protection_enabled        = true
kv_enabled_for_deployment          = true
kv_enabled_for_disk_encryption     = true
kv_enabled_for_template_deployment = true
kv_public_network_access_enabled   = false
kv_user_object_id                  = "5e0b437b-9756-4d5f-8d23-a85bc81960dd"  # Replace with your AAD client ID

# Storage Account
account_tier              = "Standard"
account_replication_type  = "LRS"
account_kind              = "StorageV2"
min_tls_version           = "TLS1_2"
access_tier               = "Hot"
allow_blob_public_access  = false

# Application Insights
application_type              = "web"
retention_in_days             = 30
sampling_percentage           = 100
disable_ip_masking            = false
local_authentication_disabled = false

# App Service
always_on       = true
https_only      = true
appinsights_key = "00000000-0000-0000-0000-000000000000"  # override by module output if needed
run_from_package = "1"
ftps_state       = "FtpsOnly"
linux_fx_version = "" # Not used for Windows; required only for Linux-based plans
plan_kind        = "app"
plan_reserved    = false
plan_sku_size    = "B1"
plan_sku_tier    = "Basic"
subnet_id = "/subscriptions/<sub-id>/resourceGroups/<rg-name>/providers/Microsoft.Network/virtualNetworks/<vnet-name>/subnets/app-service-subnet"


# Static Web App
staticweb_sku_tier       = "Standard"
staticweb_app_location   = "centralus"
staticweb_api_location   = "centralus"
staticweb_branch         = "main"

staticweb_output_location            = "build"
staticweb_repository_url            = "https://github.com/example/repo"
staticweb_staging_environment_policy = "Auto"


# SQL
sql_admin_user                = "sqladminuser"
sql_admin_password            = "P@ssword1234!"   # Use TF_VAR_sql_admin_password or Vault for production
server_version                = "12.0"
minimum_tls_version           = "1.2"
public_network_access_enabled = false
sql_sku_name                  = "Basic"
sql_max_size_gb               = 2
sql_license_type              = "LicenseIncluded"
sql_collation                 = "SQL_Latin1_General_CP1_CI_AS"
sql_zone_redundant            = false
sql_read_scale                = false



# API Management
apim_publisher_name   = "MyCompany"
apim_publisher_email  = "admin@mycompany.com"
sku_name            = "Basic_1"
apim_identity_type    = "SystemAssigned"

# Network Rules
allowed_inbound_ips  = ["0.0.0.0/0"]
allowed_outbound_ips = ["0.0.0.0/0"]

# Soft delete for Key Vault (if required somewhere)
# soft_delete_enabled = true
