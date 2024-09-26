terraform {
  backend "azurerm" {
    resource_group_name  = "rg-state-tf"
    storage_account_name = "storagestatetf"
    container_name       = "blobstatetf"
    key                  = "tf-vm-azure.tfstate"
  }
}