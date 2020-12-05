variable "region" {
  type    = string
  default = "centralus"
}

variable "resource_group" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "name" {
  type = string
}

variable "git_integration" {
  type    = string
  default = "none"
  validation {
    condition     = contains([
      "none",
      "vsts",
    ], var.git_integration)
    error_message = "Value must be one of 'none | vsts'."
  }
}

variable "vsts_config" {
  default = null
  type = object({
    account_name    = string
    branch_name     = string
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = string
  })
}
