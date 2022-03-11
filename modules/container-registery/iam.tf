resource "google_storage_bucket_iam_member" "viewer" {
  bucket = google_container_registry.registry.id

  for_each = var.iam

  role    = each.value.role
  member = each.value.member
}
