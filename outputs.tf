# Consul

output "consul_cluster_id" {
  value = hcp_consul_cluster.consul_hcp.*.cluster_id
}

output "consul_public_url" {
  value = hcp_consul_cluster.consul_hcp.*.consul_public_endpoint_url
}

output "consul_private_url" {
  value = hcp_consul_cluster.consul_hcp.*.consul_private_endpoint_url
}

output "consul_datacenter" {
  value = hcp_consul_cluster.consul_hcp.*.datacenter
}

output "consul_version" {
  value = hcp_consul_cluster.consul_hcp.*.consul_version
}

output "consul_client_config_file_decoded" {
  #value     = base64decode(hcp_consul_cluster.consul_hcp.*.consul_config_file)
  value     = hcp_consul_cluster.consul_hcp.*.consul_config_file
  sensitive = true
}

output "consul_client_ca_file" {
  value     = hcp_consul_cluster.consul_hcp.*.consul_ca_file
  sensitive = true
}

output "consul_root_token" {
  value     = hcp_consul_cluster_root_token.token.*.secret_id
  sensitive = true
}

# Vault

output "vault_public_url" {
  value = hcp_vault_cluster.vault_hcp.*.vault_public_endpoint_url
}

output "vault_private_url" {
  value = hcp_vault_cluster.vault_hcp.*.vault_private_endpoint_url
}

output "vault_root_token" {
  value     = hcp_vault_cluster_admin_token.token.*.token
  sensitive = true
}