provider "azurerm" {
features {}
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name = "msalem_arm_terraform_test"
  location= "eastus"
}

resource "azurerm_storage_account" "example" {
  name                     = "salemmsstorage202209"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
