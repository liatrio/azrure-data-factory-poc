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

variable "server_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "clients" {
  type = map(string)
  description = "Map of client name => IP for network access to server."
}

variable "key_vault_id" {
  type = string
}
