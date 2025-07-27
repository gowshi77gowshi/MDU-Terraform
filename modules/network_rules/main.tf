resource "azurerm_network_security_group" "networkrules" {
  name                = "nsg-${var.project}-${var.env}-${var.location}-${var.instance}"
  location            = var.location
  resource_group_name = var.rg_name

  tags = var.tags
}

resource "azurerm_network_security_rule" "inbound_rules" {
  for_each = toset(var.allowed_inbound_ips)

  name = "inbound-${replace(replace(each.key, ".", "-"), "/", "-")}"


  # name                        = "inbound-${replace(each.key, ".", "-")}"
  priority                    = 100 + index(var.allowed_inbound_ips, each.key)
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_address_prefix       = each.key
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.networkrules.name
  source_port_range = "*"
 

}

resource "azurerm_network_security_rule" "outbound_rules" {
  for_each = toset(var.allowed_outbound_ips)

  name = "outbound-${replace(replace(each.key, ".", "-"), "/", "-")}"


  # name                        = "outbound-${replace(each.key, ".", "-")}"
  priority                    = 200 + index(var.allowed_outbound_ips, each.key)
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = each.key
  source_port_range           = "*"
  destination_port_range      = "80"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.networkrules.name
}
