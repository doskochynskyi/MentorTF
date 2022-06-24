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

resource "azurerm_virtual_network" "net" {
  name                = "tfvnetnginx"
  address_space       = ["192.168.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "net" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.net.name
  address_prefixes     = ["192.168.140.0/24"]
}

resource "azurerm_subnet" "net" {
  name                 = "aci-subnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.net.name
  address_prefixes     = ["192.168.141.0/24"]
}



