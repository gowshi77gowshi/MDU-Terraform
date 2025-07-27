# module "rg" {
#   source    = "../../modules/rg"
#   location  = var.location
#   env  = var.environment
#   project   = var.project
#   instance  = var.instance
# }

# module "vnet" {
#   source                     = "../../modules/vnet"
#   location                   = var.location
#   env                        = var.environment
#   project                    = var.project
#   instance                   = var.instance
#   rg_name                    = module.rg.name
#   vnet_address_space         = var.vnet_address_space
#   subnet_staticweb_prefixes  = var.subnet_staticweb_prefixes
#   subnet_appsvc_prefixes     = var.subnet_appsvc_prefixes
#   subnet_sql_prefixes        = var.subnet_sql_prefixes
#   subnet_apim_prefixes       = var.subnet_apim_prefixes
#   tags                       = var.tags

#   depends_on = [module.rg]
# }

# module "key_vault" {
#   source                          = "../../modules/key_vault"
#   location                        = var.location
#   env                             = var.environment
#   project                         = var.project
#   instance                        = var.instance
#   rg_name                         = module.rg.name
#   sku_name                        = var.kv_sku_name
#   soft_delete_enabled             = var.soft_delete_enabled
#   purge_protection_enabled        = var.kv_purge_protection_enabled
#   enabled_for_deployment          = var.kv_enabled_for_deployment
#   enabled_for_disk_encryption     = var.kv_enabled_for_disk_encryption
#   enabled_for_template_deployment = var.kv_enabled_for_template_deployment
#   kv_public_network_access_enabled = var.kv_public_network_access_enabled
#   kv_user_object_id               = var.kv_user_object_id
#   tags                            = var.tags

#   depends_on = [module.rg]
# }


# module "storage_account" {
#   source                    = "../../modules/storage_account"
#   location                  = var.location
#   env                       = var.environment
#   project                   = var.project
#   instance                  = var.instance
#   rg_name                   = module.rg.name
#   account_tier              = var.account_tier
#   account_replication_type  = var.account_replication_type
#   account_kind              = var.account_kind
#   enable_https_traffic_only = var.enable_https_traffic_only
#   min_tls_version           = var.min_tls_version
#   access_tier               = var.access_tier
#   allow_blob_public_access  = var.allow_blob_public_access
#   tags                      = var.tags

#   depends_on = [module.vnet]
# }

# module "static_web" {
#   source                     = "../../modules/static_web"
#   location                   = var.location
#   env                        = var.environment
#   project                    = var.project
#   instance                   = var.instance
#   rg_name                    = module.rg.name
#   sku_tier                   = var.staticweb_sku_tier
#   repository_url             = var.staticweb_repository_url
#   branch                     = var.staticweb_branch
#   app_location               = var.staticweb_app_location
#   api_location               = var.staticweb_api_location
#   output_location            = var.staticweb_output_location
#   staging_environment_policy = var.staticweb_staging_environment_policy
#   tags                       = var.tags

#   depends_on = [module.storage_account]
# }

# module "application_insights" {
#   source                        = "../../modules/application_insights"
#   location                      = var.location
#   env                           = var.environment
#   project                       = var.project
#   instance                      = var.instance
#   rg_name                       = module.rg.name
#   application_type              = var.application_type
#   retention_in_days             = var.retention_in_days
#   sampling_percentage           = var.sampling_percentage
#   disable_ip_masking            = var.disable_ip_masking
#   local_authentication_disabled = var.local_authentication_disabled
#   tags                          = var.tags

#   depends_on = [module.rg]
# }

# module "app_service" {
#   source            = "../../modules/app_service"
#   location          = var.location
#   env               = var.environment
#   project           = var.project
#   instance          = var.instance
#   rg_name           = module.rg.name
#   appinsights_key   = module.appinsights.instrumentation_key
#   plan_sku_tier     = var.plan_sku_tier
#   plan_sku_size     = var.plan_sku_size
#   plan_kind         = var.plan_kind
#   reserved          = var.plan_reserved
#   run_from_package  = var.run_from_package
#   always_on         = var.always_on
#   linux_fx_version  = var.linux_fx_version
#   ftps_state        = var.ftps_state
#   https_only        = var.https_only
#   tags              = var.tags

#   depends_on = [module.vnet, module.application_insights]
# }

# module "sql" {
#   source                         = "../../modules/sql"
#   location                       = var.location
#   env                            = var.environment
#   project                        = var.project
#   instance                       = var.instance
#   rg_name                        = module.rg.name
#   sql_admin_user                 = var.sql_admin_user
#   sql_admin_password             = var.sql_admin_password
#   server_version                 = var.server_version
#   minimum_tls_version            = var.minimum_tls_version
#   public_network_access_enabled  = var.public_network_access_enabled
#   sku_name                       = var.sql_sku_name
#   max_size_gb                    = var.sql_max_size_gb
#   license_type                   = var.sql_license_type
#   collation                      = var.sql_collation
#   zone_redundant                 = var.sql_zone_redundant
#   read_scale                     = var.sql_read_scale
#   tags                           = var.tags

#   depends_on = [module.vnet]
# }

# module "api_management" {
#   source         = "../../modules/api_management"
#   location       = var.location
#   env            = var.environment
#   project        = var.project
#   instance       = var.instance
#   rg_name        = module.rg.name
#   publisher_name = var.apim_publisher_name
#   publisher_email = var.apim_publisher_email
#   apim_sku_name        = var.apim_sku_name
#   identity_type   = var.apim_identity_type
#   tags            = var.tags

#   depends_on = [module.vnet]
# }

# module "network_rules" {
#   source               = "../../modules/network_rules"
#   rg_name              = module.rg.name
#   location             = var.location
#   env                  = var.environment
#   project              = var.project
#   instance             = var.instance
#   allowed_inbound_ips  = var.allowed_inbound_ips
#   allowed_outbound_ips = var.allowed_outbound_ips
#   tags                 = var.tags

#   depends_on = [module.vnet]
# }
