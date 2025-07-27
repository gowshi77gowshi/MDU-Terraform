variable "location" {
  type        = string
  description = "Azure region"
}

variable "env" {
  type        = string
  description = "Deployment environment"
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

variable "allowed_inbound_ips" {
  type        = list(string)
  description = "List of allowed inbound IPs"
}

variable "allowed_outbound_ips" {
  type        = list(string)
  description = "List of allowed outbound IPs"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}
