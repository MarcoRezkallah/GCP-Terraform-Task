data "google_project" "project" {}

resource "google_storage_bucket" "bucket" {
  name          = "${data.google_project.project.project_id}-${var.bucket_name}"
  storage_class = var.storage_class
  location      = var.location
  force_destroy = true
}
