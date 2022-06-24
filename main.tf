terraform {
  backend "azurerm" {
    resource_group_name  = "RGContainer"
    storage_account_name = "samentortfstate"
    container_name       = "contmentortfstate"
    key                  = "contmentortfstate.tfstate"
  }
}


provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  version = ">=3.0.0"
  features {}
}
 
#data "azurerm_client_config" "current" {}
data "azurerm_resource_group" "rg" {
  name = "RGContainer"
}

resource "azurerm_virtual_network" "example" {
  name                = "testvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.rg.name
}
