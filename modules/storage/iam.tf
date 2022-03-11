resource "google_storage_bucket_iam_member" "viewer" {
  bucket = google_storage_bucket.bucket.name

  for_each = var.iam

  role   = each.value.role
  member = each.value.member
}
