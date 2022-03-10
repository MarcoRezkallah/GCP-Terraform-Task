resource "google_compute_instance" "instance" {
  name         = var.machine_name # "test-vm"
  machine_type = var.machine_type # "e2-medium"
  zone         = var.zone         # "us-central1-a"

  boot_disk {
    initialize_params {
      image = var.os_image # "debian-cloud/debian-9"
    }
  }

  network_interface {

    network    = var.vpc_link
    subnetwork = var.subnet_link

    access_config {
    }
  }
}
