terraform {
  required_version =  ">= 1.13.0"
  cloud {
    organization = "HCLIT"
    workspaces {  
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.36"
    }
  }
}
