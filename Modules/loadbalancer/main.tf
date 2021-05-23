resource "azurerm_lb" "demo" {
  name                = var.lb
  sku                 = "Standard"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.publicipname
    public_ip_address_id = var.public_id
  }
}
resource "azurerm_lb_backend_address_pool" "bpepool" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.demo.id
  name                = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "example" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.demo.id
  name                = "http-probe"
  protocol          = "Http"
  request_path      = "/health"
  port                = 8089
}
resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name            = var.resource_group_name
  name                           = "rdp"
  loadbalancer_id                = azurerm_lb.demo.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50019
  backend_port                   = 3389
  frontend_ip_configuration_name = var.publicipname
}

resource "azurerm_lb_rule" "demo-rule" {
  count                          ="${length(var.ports)}"
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.demo.id
  probe_id                       = azurerm_lb_probe.example.id
  name                           = "LBRule-${count.index+1}"
  protocol                       = "Tcp"
  frontend_port                  = "${var.ports[count.index]}"
  backend_port                   = "${var.ports[count.index]}"
  frontend_ip_configuration_name = var.publicipname
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
}


