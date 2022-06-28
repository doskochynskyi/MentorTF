terraform {
  backend "azurerm" {
    resource_group_name  = "RGContainer"
    storage_account_name = "samentortfstate"
    container_name       = "contmentortfstate"
    key                  = "contmentortfstate.tfstate"
  }
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}


provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed
  features {}
}
 
#data "azurerm_client_config" "current" {}
data "azurerm_resource_group" "rg" {
  name = "RGContainer"
}

resource "azurerm_resource_group" "rgdev" {
  name     = "RG${var.prefix}"
  location = "${var.region}"
}
