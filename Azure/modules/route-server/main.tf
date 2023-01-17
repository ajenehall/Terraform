resource "azurerm_subnet" "route-server-subnet" {
  name = "RouteServerSubnet"
  virtual_network_name = var.vnet-name
  resource_group_name = var.resource-group-name
  address_prefixes = [var.route-server-subnet-prefix]
}

resource "azurerm_public_ip" "route-server-public-ip" {
  name = var.route-server-public-ip-name
  resource_group_name = var.resource-group-name
  location = var.resource-group-location
  allocation_method = var.public-ip-allocation
  sku = var.public-ip-sku
}

resource "azurerm_route_server" "route-server" {
  name = var.route-server-name
  resource_group_name = var.resource-group-name
  location = var.resource-group-location
  sku = var.route-server-sku
  public_ip_address_id = azurerm_public_ip.route-server-public-ip.id
  subnet_id = azurerm_subnet.route-server-subnet.id
  branch_to_branch_traffic_enabled = true
}