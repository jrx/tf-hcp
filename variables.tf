variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "learn-hvn"
}
variable "region" {
  description = "The region of the HCP HVN and Consul cluster."
  type        = string
  default     = "us-west-2"
}
variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Consul cluster."
  type        = string
  default     = "aws"
}
variable "peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "learn-peering"
}
variable "route_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "learn-hvn-route"
}
variable "owner" {
  description = "Owner tag on all resources."
  default     = "myuser"
}
variable "hcp_client_id" {}
variable "hcp_client_secret" {}

# Consul
variable "consul_enabled" {
  type        = bool
  description = "Deploy the HCP Consul"
  default     = false
}
variable "consul_cluster_id" {
  description = "The ID of the HCP Consul cluster."
  type        = string
  default     = "test-hcp-consul"
}
variable "min_consul_version" {
  description = "The minimum Consul version of the cluster."
  type        = string
  default     = ""
}
variable "consul_public_endpoint" {
  type        = bool
  description = "Deploy with Public DNS Endpoint."
  default     = false
}

# Vault
variable "vault_enabled" {
  type        = bool
  description = "Deploy the HCP Vault"
  default     = false
}
variable "vault_cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
  default     = "test-hcp-vault"
}
variable "min_vault_version" {
  description = "The minimum Vault version of the cluster."
  type        = string
  default     = ""
}
variable "vault_public_endpoint" {
  type        = bool
  description = "Deploy with Public DNS Endpoint."
  default     = false
}