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
  description = "Resource Group name"
}


variable "publisher_name" {
  type        = string
  description = "Publisher name for APIM"
}

variable "publisher_email" {
  type        = string
  description = "Publisher email for APIM"
}

variable "sku_name" {
  type        = string
  description = "APIM SKU name. Must be one of: Consumption, Developer, Basic, Standard, Premium, Isolated."
}


variable "identity_type" {
  type        = string
  description = "Identity type for APIM (e.g., SystemAssigned)"
  default     = "SystemAssigned"
}


variable "tags" {
  type        = map(string)
  description = "Resource tags"
}

