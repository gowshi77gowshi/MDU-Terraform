variable "location" {
  type = string
}

variable "env" {
  type = string
}

variable "project" {
  type = string
}

variable "instance" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "sku_tier" {
  type    = string
  default = "Free"
}

# variable "tags" {
#   type        = string
#   description = "Environment tag"
# }

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}
