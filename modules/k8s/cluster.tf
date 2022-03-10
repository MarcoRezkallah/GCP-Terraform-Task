# K8s cluster: ▪Cluster specs:•Cluster is private[all networking configs are default].•

resource "google_container_cluster" "main_cluster" {
  name               = var.cluster_name
  location           = var.cluster_region
  node_locations     = var.cluster_zones_list
  initial_node_count = var.nodes_per_zone

  network    = var.vpc_link
  subnetwork = var.subnet_link

  cluster_autoscaling {
    enabled = false
  }

  node_config {
    disk_size_gb = 100
    disk_type    = "pd-standard"
    machine_type = var.machine_type
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_node_cidr
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.subnet_cidr
    }
  }

  ip_allocation_policy {

  }
}
