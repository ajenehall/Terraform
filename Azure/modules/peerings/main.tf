resource "azurerm_virtual_network_peering" "peer-spoke" {
  name = var.peer-spoke-name
  resource_group_name = var.resource-group-name
  virtual_network_name = var.vnet-spoke-name
  remote_virtual_network_id = var.remote-hub-vnet-id
  allow_forwarded_traffic = var.allow-forwarded-traffic-spoke
  use_remote_gateways = var.use-remote-gateways-spoke
  allow_gateway_transit = var.allow-gateway-transit-spoke
}

resource "azurerm_virtual_network_peering" "peer-hub" {
  name = var.peer-hub-name
  resource_group_name = var.resource-group-name
  virtual_network_name = var.vnet-hub-name
  remote_virtual_network_id = var.remote-spoke-vnet-id
  allow_forwarded_traffic = var.allow-forwarded-traffic-hub
  use_remote_gateways = var.use-remote-gateways-hub
  allow_gateway_transit = var.allow-gateway-transit-hub
}