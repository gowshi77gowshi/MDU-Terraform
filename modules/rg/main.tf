# Example: modules/rg/main.tf
resource "azurerm_resource_group" "resourcegrp" {
  name     = "rg-${var.project}-${var.env}-${var.location}-${var.instance}"
  location = var.location
}