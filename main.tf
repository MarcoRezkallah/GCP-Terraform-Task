module "service_accounts" {
  source = "./modules/service-account"

  for_each = tomap(
    {
      gcr = {
        account_id   = "gcr-service-account"
        account_name = "gcr Service Acoount"
      }
      gs = {
        account_id   = "gs-service-account"
        account_name = "gs Service Acoount"
      }
      bq = {
        account_id   = "bq-service-account"
        account_name = "bq Service Acoount"
      }
    }
  )

  account_id   = each.value.account_id
  account_name = each.value.account_name
}

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

module "compute" {
  source = "./modules/compute"

  machine_name = "test-vm"
  machine_type = "e2-medium"
  os_image     = "debian-cloud/debian-10"
  region       = "us-central1"
  zone         = "us-central1-a"
  vpc_link     = module.network.vpc_link
  subnet_link  = module.network.subnet_link
}

module "buckets" {
  source = "./modules/storage"

  count       = 3
  bucket_name = "bucket_${count.index + 1}"
}

module "datasets" {
  source = "./modules/dataset"

  count        = 3
  dataset_name = "dataset_${count.index + 1}"
}

module "container_registery" {
  source = "./modules/container-registery"

  iam = {
    gcr = {
      member = "serviceAccount:${module.service_accounts["gcr"].email}"
      role   = "roles/storage.objectViewer"
    }
  }
}
