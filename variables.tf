# General project context
variable "location" {
  description = "Azure region"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/stg/prod)"
  type        = string
}

variable "instance" {
  description = "Instance identifier"
  type        = string
}
# variable "tags" {
#   type        = string
#   description = "Environment tag"
# }

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}


# VNET & Subnets
variable "vnet_address_space" {
  description = "Address space for VNet"
  type        = list(string)
}

variable "subnet_staticweb_prefixes" {
  description = "CIDR for Static Web App subnet"
  type        = list(string)
}

variable "subnet_appsvc_prefixes" {
  description = "CIDR for App Service subnet"
  type        = list(string)
}

variable "subnet_sql_prefixes" {
  description = "CIDR for SQL subnet"
  type        = list(string)
}

variable "subnet_apim_prefixes" {
  description = "CIDR for APIM subnet"
  type        = list(string)
}

# Storage Account
variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "account_kind" {
  type = string
}

# variable "enable_https_traffic_only" {
#   type = bool
# }

variable "min_tls_version" {
  type = string
}

variable "access_tier" {
  type = string
}

variable "allow_blob_public_access" {
  type = bool
}

# Static Web App
variable "staticweb_sku_tier" {
  type = string
}

variable "staticweb_repository_url" {
  type = string
}

variable "staticweb_branch" {
  type = string
}

variable "staticweb_app_location" {
  type = string
}

variable "staticweb_api_location" {
  type = string
}

variable "staticweb_output_location" {
  type = string
}

variable "staticweb_staging_environment_policy" {
  type = string
}

# Application Insights
variable "application_type" {
  type = string
}

variable "retention_in_days" {
  type = number
}

variable "sampling_percentage" {
  type = number
}

variable "disable_ip_masking" {
  type = bool
}

variable "local_authentication_disabled" {
  type = bool
}

# App Service Plan
variable "plan_sku_tier" {
  type = string
}

variable "plan_sku_size" {
  type = string
}

variable "plan_kind" {
  type = string
}

variable "plan_reserved" {
  type = bool
}

# App Service Config
variable "run_from_package" {
  type = bool
}

variable "always_on" {
  type = bool
}

variable "linux_fx_version" {
  type = string
}

variable "ftps_state" {
  type = string
}

variable "https_only" {
  type = bool
}

variable "subnet_id" {
  description = "The ID of the delegated subnet for App Service"
  type        = string
}


# SQL Server + DB
variable "sql_admin_user" {
  type = string
}

variable "sql_admin_password" {
  type = string
  sensitive = true
}

variable "server_version" {
  type = string
}

variable "minimum_tls_version" {
  type = string
}

variable "public_network_access_enabled" {
  type = bool
}

variable "sql_sku_name" {
  type = string
}

variable "sql_max_size_gb" {
  type = number
}

variable "sql_license_type" {
  type = string
}

variable "sql_collation" {
  type = string
}

variable "sql_zone_redundant" {
  type = bool
}

variable "sql_read_scale" {
  type = bool
}


# variable "sql_subnet_id" {
#   description = "ID of the subnet to which the SQL Server private endpoint will be connected"
#   type        = string
# }

# variable "vnet_id" {
#   description = "ID of the Virtual Network used for DNS linking"
#   type        = string
# }

# API Management
variable "apim_publisher_name" {
  type = string
}

variable "apim_publisher_email" {
  type = string
}

# variable "apim_sku_name" {
#   type = string
# }

variable "sku_name" {
  type    = string
  # default = "Developer_1" # or any other valid one
}


variable "apim_identity_type" {
  type = string
}

# Network Rules
variable "allowed_inbound_ips" {
  type = list(string)
}

variable "allowed_outbound_ips" {
  type = list(string)
}

# Key Vault
variable "kv_sku_name" {
  type = string
}

# variable "soft_delete_enabled" {
#   type = bool
# }

variable "kv_purge_protection_enabled" {
  type = bool
}

variable "kv_enabled_for_deployment" {
  type = bool
}

variable "kv_enabled_for_disk_encryption" {
  type = bool
}

variable "kv_enabled_for_template_deployment" {
  type = bool
}

variable "kv_public_network_access_enabled" {
  type = bool
}

variable "kv_user_object_id" {
  type = string
}


variable "appinsights_key" {
  description = "Instrumentation Key for Application Insights"
  type        = string
}


