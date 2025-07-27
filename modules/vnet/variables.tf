variable "location" {
  type        = string
  description = "Azure region"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., Dev, Staging, Prod)"
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
  description = "Resource group name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "subnet_staticweb_prefixes" {
  type        = list(string)
  description = "Address prefixes for Static Web App subnet"
}

variable "subnet_appsvc_prefixes" {
  type        = list(string)
  description = "Address prefixes for App Service subnet"
}

variable "subnet_sql_prefixes" {
  type        = list(string)
  description = "Address prefixes for SQL subnet"
}

variable "subnet_apim_prefixes" {
  type        = list(string)
  description = "Address prefixes for APIM subnet"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
}
