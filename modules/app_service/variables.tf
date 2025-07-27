variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "web_app_name" {
  description = "The name of the Windows Web App"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where resources will be created"
  type        = string
}

variable "os_type" {
  description = "Operating system type for the App Service Plan (Windows or Linux)"
  type        = string
  default     = "Windows"
}

variable "sku_name" {
  description = "SKU for the App Service Plan (e.g., B1, P1v2)"
  type        = string
}

variable "stack" {
  description = "The application stack (e.g., 'dotnet')"
  type        = string
}

variable "dotnet_version" {
  description = "Version of .NET to run (e.g., 'v6.0', 'v8.0')"
  type        = string
}

variable "always_on" {
  description = "Whether 'Always On' should be enabled"
  type        = bool
  default     = true
}

variable "https_only" {
  description = "Enforce HTTPS-only access"
  type        = bool
  default     = true
}

variable "app_settings" {
  description = "Map of application settings"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "appinsights_key" {
  description = "Instrumentation Key from Application Insights"
  type        = string
}


variable "subnet_id" {
  description = "The ID of the delegated subnet for App Service"
  type        = string
}


