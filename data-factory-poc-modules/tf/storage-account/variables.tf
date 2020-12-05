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

variable "replication_type" {
  type = string
  default = "ZRS"
}

variable "min_tls_version" {
  type = string
  default = "TLS1_2"
}
