variable "location" {
  description = "Azure region"
  type        = string
}

variable "env" {
  description = "Environment (e.g., dev, prod)"
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
  description = "Name of the resource group"
  type        = string
}

variable "application_type" {
  description = "Application type for App Insights (e.g., web, other)"
  type        = string
}

variable "retention_in_days" {
  description = "Data retention period in days"
  type        = number
}

variable "sampling_percentage" {
  description = "Percentage of data sampled"
  type        = number
}

variable "disable_ip_masking" {
  description = "Whether IP masking is disabled"
  type        = bool
}

variable "local_authentication_disabled" {
  description = "Disable local authentication methods"
  type        = bool
}

# variable "tags" {
#   type        = string
#   description = "Environment tag"
# }

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}