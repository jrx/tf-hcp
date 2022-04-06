output "consul_root_token" {
  value     = hcp_consul_cluster_root_token.token.secret_id
  sensitive = true
}

output "consul_url" {
  value = hcp_consul_cluster.example_hcp.public_endpoint ? (
    hcp_consul_cluster.example_hcp.consul_public_endpoint_url
    ) : (
    hcp_consul_cluster.example_hcp.consul_private_endpoint_url
  )
}

output "consul_version" {
  value = hcp_consul_cluster.example_hcp.consul_version
}

output "client_config_file" {
  value     = hcp_consul_cluster.example_hcp.consul_config_file
  sensitive = true
}

output "client_ca_file" {
  value     = hcp_consul_cluster.example_hcp.consul_ca_file
  sensitive = true
}