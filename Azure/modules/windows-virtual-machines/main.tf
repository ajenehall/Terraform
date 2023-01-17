resource "azurerm_network_interface" "network-interface" {
  count = length(var.windows-vm-name)
  name = "${var.windows-vm-name[count.index]}-nic"
  resource_group_name = var.resource-group-name[0]
  location = var.resource-group-location[0]

  ip_configuration {
    name = "internal"
    subnet_id = var.subnet-id[count.index]
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "windows-virtual-machine" {
  count = length(var.windows-vm-name)
  name = var.windows-vm-name[count.index]
  resource_group_name = var.resource-group-name[0]
  location = var.resource-group-location[0]
  size = var.vm-size
  admin_username = var.admin-user
  admin_password = var.admin-password
  network_interface_ids = [azurerm_network_interface.network-interface[count.index].id]

  os_disk {
  caching              = var.os-disk-caching
  storage_account_type = var.os-disk-storage
  }

  source_image_reference {
    publisher = var.image-publisher
    offer     = var.image-offer
    sku       = var.image-sku
    version   = var.image-version
  }
}