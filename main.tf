terraform {
  required_version = ">= 0.12.0"
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
