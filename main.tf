terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "pratham_rg"
    storage_account_name = "prathamsstorage"
    container_name       = "terraform-state"
    key                  = "jenkins-demo.tfstate"
  }
}

provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "pratham_rg" {
  name     = "pratham-JenkinsTerraformRG"
  location = "Central US"
}

resource "azurerm_virtual_network" "pratham_vnet" {
  name                = "pratham-JenkinsVNet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.pratham_rg.location
  resource_group_name = azurerm_resource_group.pratham_rg.name
}
