resource "google_compute_firewall" "default_firewall" {
  name    = "vpc-allow-ssh-firewall"
  network = google_compute_network.vpc_network.id

  # description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
