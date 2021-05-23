az group create --location westus --name ${env:TERRAFORMSTG}

az storage account create --name ${env:TERRAFORMSTORAGEACCOUNT} --resource-group ${env:TERRAFORMSTG} --location westus --sku Standard_LRS

az storage container create --name terraform --account-name ${env:TERRAFORMSTORAGEACCOUNT}

az storage account keys list -g ${env:TERRAFORMSTG} -n ${env:TERRAFORMSTORAGEACCOUNT}