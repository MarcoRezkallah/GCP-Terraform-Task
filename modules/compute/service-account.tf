resource "google_service_account" "account" {
  account_id   = var.machine_account_id
  display_name = var.machine_name
}
