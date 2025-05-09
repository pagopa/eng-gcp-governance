resource "google_org_policy_policy" "storage_publicAccessPrevention" {
  name   = "folders/${var.folder_id}/policies/storage.publicAccessPrevention"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      enforce = "TRUE"
    }
  }
}
