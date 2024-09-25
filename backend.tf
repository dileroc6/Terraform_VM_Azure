terraform {
  backend "azurerm" {
    resource_group_name  = "rg-state-tf"
    storage_account_name = "storage-state-tf"
    container_name       = "blob-state-tf"
    key                  = "tf-vm-azure.tfstate"
  }
}