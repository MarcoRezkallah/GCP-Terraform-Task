module "network" {
  source = "./modules/network"

  vpc_name    = "main-vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_name = "main-subnet"
  subnet_cidr = "10.0.1.0/24"
}

module "k8s" {
  source = "./modules/k8s"

  cluster_region     = "us-central1"
  cluster_zones_list = ["us-central1-c", "us-central1-f"]
  machine_type       = "e2-standard-2"
  nodes_per_zone     = 2
  cluster_name       = "main-cluster"
  master_node_cidr   = "192.168.1.0/28"
  vpc_link           = module.network.vpc_link
  subnet_link        = module.network.subnet_link
  subnet_cidr        = module.network.subnet_cidr
}
