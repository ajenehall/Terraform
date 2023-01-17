resource "azurerm_lb" "load-balancer" {
  name = var.lb-name 
  location = var.resource-group-location
  resource_group_name = var.resource-group-name
  sku = var.lb-sku

  frontend_ip_configuration {
    name = var.lb-frontend-ip-name
    private_ip_address_allocation = var.private-ip-address-allocation 
    subnet_id = var.lb-frontend-ip-subnet-id
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name = var.pool-name
}

resource "azurerm_lb_backend_address_pool_address" "pool-members" {
  count = length(var.pool-member-names)
  name = var.pool-member-names[count.index]
  ip_address = var.pool-member-ip-address[count.index]
  virtual_network_id = var.vnet-id
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
}

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name = var.lb-probe-name
  port = var.lb-probe-port
  protocol = var.lb-probe-protocol
}

resource "azurerm_lb_rule" "lb-rule" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name = var.lb-rule-name
  protocol = var.lb-rule-protocol
  frontend_port = var.lb-rule-frontend-port
  backend_port = var.lb-rule-backend-port
  frontend_ip_configuration_name = azurerm_lb.load-balancer.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.pool.id]
  probe_id = azurerm_lb_probe.probe.id
}