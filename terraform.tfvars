#Resource Group variables details for creation
resource_group_name     = "terraform-test-manideep"
resource_group_location = "westeurope"

#Vnet variables
vnet   = "vmssvnet"
subnet = "vmsssubnet"
nsg    = "vmssnsg"

#publip
publicipname = "testpublipcipaddress"

#loadbalancer
lb = "VMSSloadbalancer"

#VMSS
vmssname = "vmsswin"
username = "azureuser"
password = "Neudesic@12345"