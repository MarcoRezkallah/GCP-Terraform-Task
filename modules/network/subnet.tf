resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc_network.id
}
