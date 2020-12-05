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

resource "azurerm_storage_account" "this" {
  name                     = var.name
  location                 = var.region
  resource_group_name      = var.resource_group
  account_kind             = "StorageV2"
  account_replication_type = var.replication_type
  account_tier             = "Standard"
  min_tls_version          = var.min_tls_version
}
