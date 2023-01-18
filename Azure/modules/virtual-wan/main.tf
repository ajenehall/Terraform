resource "azurerm_virtual_wan" "virtual-wan" {
  name = var.virtual-wan-name
  resource_group_name = var.resource-group-name
  location = var.resource-group-location
  type = var.virtual-wan-type
}

resource "azurerm_virtual_hub" "virtual-hub" {
    depends_on = [
      azurerm_virtual_wan.virtual-wan
    ]
  name = var.virtual-hub-name
  resource_group_name = var.resource-group-name
  location = var.resource-group-location
  virtual_wan_id = azurerm_virtual_wan.virtual-wan.id
  sku = var.virtual-hub-sku
  address_prefix = var.virtual-hub-address-prefix
}

resource "azurerm_virtual_hub_connection" "virtual-hub-connection" {
  depends_on = [
    azurerm_virtual_hub.virtual-hub
  ]
  count = length(var.virtual-hub-connection-vnet-id)
  name = var.virtual-hub-connection-name[count.index]
  virtual_hub_id = azurerm_virtual_hub.virtual-hub.id
  remote_virtual_network_id = var.virtual-hub-connection-vnet-id[count.index]
}