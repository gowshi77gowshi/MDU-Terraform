variable "location" {
  description = "Azure location"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "instance" {
  description = "Instance identifier"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
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


# variable "soft_delete_enabled" {
#   description = "Enable soft delete for the key vault"
#   type        = bool
# }

variable "kv_purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
}

variable "kv_enabled_for_deployment" {
  description = "Allow Virtual Machines to retrieve certificates stored as secrets from the key vault"
  type        = bool
}

variable "kv_enabled_for_disk_encryption" {
  description = "Allow Azure Disk Encryption to retrieve secrets from the vault and unwrap keys"
  type        = bool
}

variable "kv_enabled_for_template_deployment" {
  description = "Allow Resource Manager to retrieve secrets from the vault when deploying resources"
  type        = bool
}

variable "kv_sku_name" {
  type = string
}


variable "kv_user_object_id" {
  description = "The object ID of the user or principal to assign Key Vault access to"
  type        = string
}
variable "kv_public_network_access_enabled" {
  type = bool
}


