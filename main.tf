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

data "azurerm_subscription" "current" {}



resource "azurerm_resource_group" "rg" {
  name = msalem_arm_terraform
  location= eastus
}

resource "azurerm_storage_account" "example" {
  name                     = "msalemarmstorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}