terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.36.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

resource "azurerm_key_vault" "this" {
  location                  = var.region
  name                      = var.name
  resource_group_name       = var.resource_group
  sku_name                  = var.sku
  tenant_id                 = var.tenant_id
  enable_rbac_authorization = true
}
