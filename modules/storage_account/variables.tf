variable "location" {
  description = "Azure region"
  type        = string
}

variable "env" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "instance" {
  description = "Instance identifier (e.g., 01)"
  type        = string
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "account_tier" {
  description = "Storage account tier (e.g., Standard, Premium)"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type (e.g., LRS, GRS, ZRS)"
  type        = string
}

variable "account_kind" {
  description = "Kind of storage account (e.g., StorageV2, BlobStorage)"
  type        = string
}

# variable "enable_https_traffic_only" {
#   description = "Enable HTTPS only traffic"
#   type        = bool
# }

variable "min_tls_version" {
  description = "Minimum TLS version"
  type        = string
}

variable "access_tier" {
  description = "Access tier for blob storage (e.g., Hot, Cool)"
  type        = string
}

# variable "allow_blob_public_access" {
#   description = "Whether to allow public access to blobs"
#   type        = bool
# }

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
