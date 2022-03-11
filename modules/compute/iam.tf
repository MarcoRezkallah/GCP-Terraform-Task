resource "google_service_account_iam_member" "admin-account-iam" {
  for_each = var.service_accounts

  service_account_id = each.value

  role   = "roles/iam.serviceAccountUser"
  member = "serviceAccount:${google_service_account.account.email}"
}
