data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    workspaces = {
      name = "net-dev"
    }
    hostname     = "app.terraform.io"
    organization = "jrx"
  }
}

provider "aws" {
  region = data.terraform_remote_state.vpc.outputs.aws_region
}

resource "hcp_aws_network_peering" "peer" {
  hvn_id          = hcp_hvn.example_hvn.hvn_id
  peering_id      = var.peering_id
  peer_vpc_id     = data.terraform_remote_state.vpc.outputs.aws_vpc_id
  peer_account_id = data.terraform_remote_state.vpc.outputs.aws_owner_id
  peer_vpc_region = data.terraform_remote_state.vpc.outputs.aws_region
}

resource "hcp_hvn_route" "peer_route" {
  hvn_link         = hcp_hvn.example_hvn.self_link
  hvn_route_id     = var.route_id
  destination_cidr = data.terraform_remote_state.vpc.outputs.aws_cidr
  target_link      = hcp_aws_network_peering.peer.self_link
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
  auto_accept               = true
}

data "aws_route_table" "peer" {
  vpc_id = data.terraform_remote_state.vpc.outputs.aws_vpc_id
  filter {
    name   = "tag:Name"
    values = ["jrx-dev-vpc-public"]
  }
}

resource "aws_route" "peer_route" {
  route_table_id            = data.aws_route_table.peer.id
  destination_cidr_block    = hcp_hvn.example_hvn.cidr_block
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
}

resource "aws_security_group" "default" {
  name   = "${var.cluster_id}_default"
  vpc_id = data.terraform_remote_state.vpc.outputs.aws_vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
      "172.25.16.0/20",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "sg-${var.cluster_id}"
    Owner = var.owner
  }
}