provider "azurerm" {
version = "~> 2.6.0"
features {}
}


terraform {
  
  required_version = ">= 1.3.0"
  # Backend variables are initialized by Azure DevOps
  backend "azurerm" {}
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