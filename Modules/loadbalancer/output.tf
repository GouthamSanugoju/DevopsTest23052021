output "lb_id" {
    value = azurerm_lb.demo.id
}

output "lb_probe_id" {
    value = azurerm_lb_probe.example.id
}

output "nat_pool_id" {
    value = azurerm_lb_nat_pool.lbnatpool.id
}

output "bdepool_id" {
    value = azurerm_lb_backend_address_pool.bpepool.id
}
