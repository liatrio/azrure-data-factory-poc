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

resource "azurerm_data_factory" "this" {
  location            = var.region
  name                = var.name
  resource_group_name = var.resource_group

  // Managed Identity is only created if this block is present
  identity {
    type = "SystemAssigned"
  }

  dynamic vsts_configuration {
    for_each = var.git_integration == "vsts" ? [""] : []
    content {
      account_name    = var.vsts_config.account_name
      branch_name     = var.vsts_config.branch_name
      project_name    = var.vsts_config.project_name
      repository_name = var.vsts_config.repository_name
      root_folder     = var.vsts_config.root_folder
      tenant_id       = var.vsts_config.tenant_id
    }
  }
}
