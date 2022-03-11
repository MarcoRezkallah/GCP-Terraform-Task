resource "google_bigquery_dataset_iam_member" "viewer" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id

  for_each = var.iam

  role   = each.value.role
  member = each.value.member
}
