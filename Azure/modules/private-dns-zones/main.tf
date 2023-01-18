resource "azurerm_private_dns_zone" "main" {
  name = var.private-dns-zone-name
  resource_group_name = var.resource-group-name
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name = var.network-link-name
  resource_group_name = var.resource-group-name
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id = var.virtual-network-id
  registration_enabled = var.registration
}