#Provider
provider "azurerm" {
  features {}
}

#Resource Group
module "resourcegroup" {
  source                  = "./modules/resourcegroup"
  resource_group_name     =    var.resource_group_name
  resource_group_location =    var.resource_group_location

}

#vnet
module "vnet" {
  depends_on = [
    module.resourcegroup
  ]
  source   =    "./modules/vnet"
  resource_group_name     =    var.resource_group_name
  resource_group_location =    var.resource_group_location
  vnet     =    var.vnet
  subnet   =    var.subnet
  nsg      =    var.nsg
}

#publicip
module "publicip" {
  depends_on = [
    module.vnet
  ]
  source                  =   "./modules/publicip"
  resource_group_name     =    var.resource_group_name
  resource_group_location =    var.resource_group_location
  publicipname            =    var.publicipname
}

#Loadbalancer
module "loadbalancer" {
  depends_on = [
    module.publicip
  ]
  source = "./modules/loadbalancer"
  resource_group_name     =    var.resource_group_name
  resource_group_location =    var.resource_group_location
  publicipname            =    var.publicipname
  public_id               =    module.publicip.public_id
  lb                      =    var.lb
}

module "VMSS" {
  depends_on = [
    module.loadbalancer
  ]
  source = "./modules/VMSS"
  resource_group_name     =    var.resource_group_name
  resource_group_location =    var.resource_group_location
  vmssname                =    var.vmssname
  username                =    var.username
  password                =    var.password
  subnet_id               =    module.vnet.subnet_id
  bdepool_id              =    module.loadbalancer.bdepool_id
  nat_pool_id             =    module.loadbalancer.nat_pool_id
}