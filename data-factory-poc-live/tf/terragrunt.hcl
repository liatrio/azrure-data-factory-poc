locals {
  common                 = yamldecode(file("common_vars.yaml"))
  subscription           = read_terragrunt_config(find_in_parent_folders("subscription.hcl"))
  terragrunt_module_name = replace(path_relative_to_include(), "/^.*//", "")
  # strips subscription at beginning of directory path string

  terraform_sources = {
    local  = "${path_relative_from_include()}/../../data-factory-poc-modules//tf/${local.terragrunt_module_name}"
    remote = "<<TODO: repository link to terraform modules>>"
  }

  terraform_source = local.terraform_sources[get_env("TERRAFORM_SOURCE", "remote")]
}

remote_state {
  backend = "azurerm"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    resource_group_name  = local.common.resource_group
    storage_account_name = local.subscription.locals.backend_storage_account
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"

    tenant_id       = local.common.tenant_id
    subscription_id = local.subscription.locals.subscription_id
  }
}

inputs = {
  resource_group  = local.common.resource_group
  subscription_id = local.subscription.locals.subscription_id
  tenant_id       = local.common.tenant_id
}

terraform {
  source = local.terraform_source
}
