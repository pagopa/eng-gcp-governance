resource "google_org_policy_policy" "iam_managed_disableServiceAccountKeyUpload" {
  name   = "folders/${var.folder_id}/policies/iam.managed.disableServiceAccountKeyUpload"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      enforce = "TRUE"
    }
  }
}
