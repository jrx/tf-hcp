provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
}

resource "hcp_hvn" "example_hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
}

resource "hcp_consul_cluster" "example_hcp" {
  hvn_id     = hcp_hvn.example_hvn.hvn_id
  cluster_id = var.cluster_id
  tier       = "development"
  #   public_endpoint = true
}

resource "hcp_consul_cluster_root_token" "token" {
  cluster_id = hcp_consul_cluster.example_hcp.id
}