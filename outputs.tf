output "consul_cluster_id" {
  value = hcp_consul_cluster.example_hcp.cluster_id
}

output "consul_public_url" {
  value = hcp_consul_cluster.example_hcp.consul_public_endpoint_url
}

output "consul_private_url" {
  value = hcp_consul_cluster.example_hcp.consul_private_endpoint_url
}

output "consul_datacenter" {
  value = hcp_consul_cluster.example_hcp.datacenter
}

output "consul_version" {
  value = hcp_consul_cluster.example_hcp.consul_version
}

output "client_config_file_decoded" {
  value     = base64decode(hcp_consul_cluster.example_hcp.consul_config_file)
  sensitive = true
}

output "client_ca_file" {
  value     = hcp_consul_cluster.example_hcp.consul_ca_file
  sensitive = true
}

output "consul_root_token" {
  value     = hcp_consul_cluster_root_token.token.secret_id
  sensitive = true
}