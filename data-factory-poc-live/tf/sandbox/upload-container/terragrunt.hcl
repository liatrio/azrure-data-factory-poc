include {
  path = "${find_in_parent_folders()}"
}

locals {
  common = yamldecode(file(find_in_parent_folders("common_vars.yaml")))

  terraform_sources = {
    local  = "${get_parent_terragrunt_dir()}/../../data-factory-poc-modules//tf/storage-container"
    remote = "<<TODO: repository to get modules from>>"
  }

  terraform_source = local.terraform_sources[get_env("TERRAFORM_SOURCE", "remote")]
}

dependency "storage_account" {
  config_path  = "../storage-account"
  mock_outputs = {
    name = "mock"
  }
}

dependency "data_factory" {
  config_path  = "../data-factory"
  mock_outputs = {
    managed_identity_principal_id = "mock"
  }
}

inputs = {
  name                      = "upload"
  storage_account_name      = dependency.storage_account.outputs.name
  contributor_principal_ids = [
    dependency.data_factory.outputs.managed_identity_principal_id
  ]
}

terraform {
  source = local.terraform_source
}
