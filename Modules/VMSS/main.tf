resource "azurerm_windows_virtual_machine_scale_set" "example" {
  name                = var.vmssname
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Standard_F2"
  instances           = 1
  admin_password      = var.password
  admin_username      = var.username

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name                                   = "IPConfiguration"
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [var.bdepool_id]
      load_balancer_inbound_nat_rules_ids    = [var.nat_pool_id]
      
    }
  }
}