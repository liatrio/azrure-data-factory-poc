include {
  path = "${find_in_parent_folders()}"
}

locals {
  common = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

inputs = {
  name            = "ldatafactorypocnp"
  git_integration = "none"
}
