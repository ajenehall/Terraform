# resource "azurerm_resource_group" "resource-group" {
#   count = length(var.resource-group-name)
#   name = var.resource-group-name[count.index]
#   location = var.resource-group-location[count.index]
# }

resource "azurerm_public_ip" "bastion-public-ip" {
  count = length(var.bastion-host-public-ip)
  name = var.bastion-host-public-ip[count.index]
  location = var.resource-group-location[count.index]
  resource_group_name = var.resource-group-name[count.index]
  allocation_method = var.bastion-public-ip-allocation-method
  sku = var.bastion-public-ip-sku
}

resource "azurerm_subnet" "bastion-subnet" {
  count = length(var.bastion-subnet-name)
  name = var.bastion-subnet-name[count.index]
  address_prefixes = [ var.bastion-subnet-prefix[count.index] ]
  resource_group_name = var.resource-group-name[count.index]
  virtual_network_name = var.bastion-virtual-network[count.index]
}

resource "azurerm_bastion_host" "bastion-host" {
  count = length(var.bastion-host-name)
  name = var.bastion-host-name[count.index]
  location = var.resource-group-location[count.index]
  resource_group_name = var.resource-group-name[count.index]

  ip_configuration {
    name = "bastion-host-ip-config"
    subnet_id = azurerm_subnet.bastion-subnet[count.index].id
    public_ip_address_id = azurerm_public_ip.bastion-public-ip[count.index].id
  }
}