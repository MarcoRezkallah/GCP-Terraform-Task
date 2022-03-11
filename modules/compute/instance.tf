resource "google_compute_instance" "instance" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = var.zone

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  network_interface {

    network    = var.vpc_link
    subnetwork = var.subnet_link

    access_config {
    }
  }
  service_account {
    email  = google_service_account.account.email
    scopes = ["cloud-platform"]
  }
}
