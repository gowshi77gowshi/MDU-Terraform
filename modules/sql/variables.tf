variable "location" {
  type        = string
  description = "Azure region"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "instance" {
  type        = string
  description = "Instance identifier"
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "sql_admin_user" {
  type        = string
  description = "SQL Server admin username"
}

variable "sql_admin_password" {
  type        = string
  description = "SQL Server admin password"
  sensitive   = true
}

variable "server_version" {
  type        = string
  description = "SQL Server version"
  default     = "12.0"
}

variable "minimum_tls_version" {
  type        = string
  description = "Minimum TLS version for SQL Server"
  default     = "1.2"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Allow public network access to SQL Server"
  default     = true
}

variable "sql_sku_name" {
  type = string
}


variable "max_size_gb" {
  type        = number
  description = "Max size for the database in GB"
}

variable "license_type" {
  type        = string
  description = "License type (e.g. LicenseIncluded, BasePrice)"
  default     = "LicenseIncluded"
}

variable "collation" {
  type        = string
  description = "Database collation"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "zone_redundant" {
  type        = bool
  description = "Enable zone redundancy"
  default     = false
}

variable "read_scale" {
  type        = bool
  description = "Enable read scale for SQL Database"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
}

variable "sql_subnet_id" {
  description = "ID of the subnet to which the SQL Server private endpoint will be connected"
  type        = string
}

variable "vnet_id" {
  description = "ID of the Virtual Network used for DNS linking"
  type        = string
}





