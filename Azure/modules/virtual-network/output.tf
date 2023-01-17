output "subnet-id" {
  description = "ID of a subnet"
  value = azurerm_subnet.subnet[*].id
}

output "virtual-network-id" {
  description = "ID of a virtual network"
  value = azurerm_virtual_network.vnet[*].id
}

output "vnet-name" {
  description = "Name of the virtual network"
  value = azurerm_virtual_network.vnet[*].name
}