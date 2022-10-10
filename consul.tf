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
  count              = (var.consul_enabled == true ? 1 : 0)
  hvn_id             = hcp_hvn.example_hvn.hvn_id
  cluster_id         = var.consul_cluster_id
  tier               = "plus"
  size               = "small"
  public_endpoint    = true
  min_consul_version = var.min_consul_version
}

resource "hcp_consul_cluster_root_token" "token" {
  count      = (var.consul_enabled == true ? 1 : 0)
  cluster_id = hcp_consul_cluster.example_hcp[count.index].id
}