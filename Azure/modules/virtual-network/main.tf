resource "azurerm_virtual_network" "vnet" {
  count = length(var.vnet-address-space)
  name = var.vnet-name
  resource_group_name = var.resource-group-name
  location = var.resource-group-location
  address_space = [ var.vnet-address-space[count.index] ]
}

resource "azurerm_subnet" "subnet" {
  count = length(var.subnet-name)
  name = var.subnet-name[count.index]
  address_prefixes = [ var.subnet-address-prefix[count.index] ]
  resource_group_name = var.resource-group-name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
}