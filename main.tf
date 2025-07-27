provider "azurerm" {
  features {}
  subscription_id = "337c0fb8-7f2f-4990-bfd1-828dcc1fff09"
}


variable "env" {
  type    = string
  default = "dev"
  validation {
    condition     = contains(["dev", "stg", "prod"], var.env)
    error_message = "env must be one of: dev, stg, prod"
  }
}

module "Dev" {
  source = "./Environments/Dev"
  count  = var.env == "dev" ? 1 : 0
}

# variable "location" {
#   type    = string
#   default = "East US"

#   validation {
#     condition     = contains(["East US", "UK South", "Central India"], var.location)
#     error_message = "location must be one of: East US, West Europe, Central India"
#   }
# }


# module "stg" {
#   source = "./environment/stg"
#   count  = var.env == "stg" ? 1 : 0
# }

# module "prod" {
#   source = "./environment/prod"
#   count  = var.env == "prod" ? 1 : 0
# }



module "rg" {
  source    = "./modules/rg"
  location  = var.location
  env  = var.environment
  project   = var.project
  instance  = var.instance
}

module "vnet" {
  source                     = "./modules/vnet"
  location                   = var.location
  env                        = var.environment
  project                    = var.project
  instance                   = var.instance
  rg_name                    = module.rg.name
  vnet_address_space         = var.vnet_address_space
  subnet_staticweb_prefixes  = var.subnet_staticweb_prefixes
  subnet_appsvc_prefixes     = var.subnet_appsvc_prefixes
  subnet_sql_prefixes        = var.subnet_sql_prefixes
  subnet_apim_prefixes       = var.subnet_apim_prefixes
  tags                = var.tags
  

  depends_on = [module.rg]
}
module "key_vault" {
  source    = "./modules/key_vault"
  location  = var.location
  env       = var.environment
  project   = var.project
  instance  = var.instance
  rg_name   = module.rg.name

  kv_sku_name                        = var.kv_sku_name
  # kv_soft_delete_enabled             = var.kv_soft_delete_enabled
  kv_purge_protection_enabled        = var.kv_purge_protection_enabled
  kv_enabled_for_deployment          = var.kv_enabled_for_deployment
  kv_enabled_for_disk_encryption     = var.kv_enabled_for_disk_encryption
  kv_enabled_for_template_deployment = var.kv_enabled_for_template_deployment
  kv_public_network_access_enabled   = var.kv_public_network_access_enabled
  kv_user_object_id                  = var.kv_user_object_id
  tags                               =var.tags
}



module "storage_account" {
  source                    = "./modules/storage_account"
  location                  = var.location
  env                       = var.environment
  project                   = var.project
  instance                  = var.instance
  rg_name                   = module.rg.name
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  account_kind              = var.account_kind
  # enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version           = var.min_tls_version
  access_tier               = var.access_tier
  # allow_blob_public_access  = var.allow_blob_public_access
  tags                = var.tags


  depends_on = [module.vnet]
}

module "static_web" {
  source                     = "./modules/static_web"
  location                   = var.location
  env                        = var.environment
  project                    = var.project
  instance                   = var.instance
  rg_name                    = module.rg.name

  sku_tier                   = var.staticweb_sku_tier
  
 tags                = var.tags

  depends_on = [module.rg]
}

module "application_insights" {
  source                        = "./modules/application_insights"
  location                      = var.location
  env                           = var.environment
  project                       = var.project
  instance                      = var.instance
  rg_name                       = module.rg.name
  application_type              = var.application_type
  retention_in_days             = var.retention_in_days
  sampling_percentage           = var.sampling_percentage
  disable_ip_masking            = var.disable_ip_masking
  local_authentication_disabled = var.local_authentication_disabled
  
  tags                = var.tags


  depends_on = [module.rg]
}

module "app_service" {
  source = "./modules/app_service"

  app_service_plan_name = "asp-${var.project}-${var.env}"
  web_app_name          = "web-${var.project}-${var.env}"
  location              = var.location
  resource_group_name   = module.rg.name
  os_type               = "Windows"
  sku_name              = "B1"
  stack                 = "dotnet"
  dotnet_version        = "v8.0"
  always_on             = true
  https_only            = true
  appinsights_key       = module.application_insights.instrumentation_key
  subnet_id = module.vnet.subnet_ids["app_service"]

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"           = "1"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = module.application_insights.instrumentation_key

  }

  tags                = var.tags

   depends_on = [module.vnet, module.application_insights]
  }


module "sql" {
  source                         = "./modules/sql"
  location                       = var.location
  env                            = var.environment
  project                        = var.project
  instance                       = var.instance
  rg_name                        = module.rg.name
 vnet_id        = module.vnet.vnet_id
  sql_subnet_id  = module.vnet.subnet_ids["sql"]
                   
  sql_admin_user                 = var.sql_admin_user
  sql_admin_password             = var.sql_admin_password
  server_version                 = var.server_version
  minimum_tls_version            = var.minimum_tls_version
  public_network_access_enabled  = var.public_network_access_enabled
  sql_sku_name                    = var.sql_sku_name
  max_size_gb                    = var.sql_max_size_gb
  license_type                   = var.sql_license_type
  collation                      = var.sql_collation
  zone_redundant                 = var.sql_zone_redundant
  read_scale                     = var.sql_read_scale
   tags                = var.tags

  depends_on = [module.vnet]
}

module "api_management" {
  source         = "./modules/api_management"
  location       = var.location
  env            = var.environment
  project        = var.project
  instance       = var.instance
  rg_name        = module.rg.name
  publisher_name = var.apim_publisher_name
  publisher_email = var.apim_publisher_email
  sku_name      = var.sku_name
  identity_type   = var.apim_identity_type

  tags                = var.tags

  depends_on = [module.vnet]
}

module "network_rules" {
  source               = "./modules/network_rules"
  rg_name              = module.rg.name
  location             = var.location
  env                  = var.environment
  project              = var.project
  instance             = var.instance
  allowed_inbound_ips  = var.allowed_inbound_ips
  allowed_outbound_ips = var.allowed_outbound_ips
  

  tags                = var.tags

  depends_on = [module.vnet]
}




