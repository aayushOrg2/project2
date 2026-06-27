terraform {
  required_version = ">= 1.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.23.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "2.9.0"
    }
  }
}

provider "azurerm" {
  features {}
}