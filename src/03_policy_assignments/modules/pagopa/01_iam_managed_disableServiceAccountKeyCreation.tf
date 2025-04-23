resource "google_org_policy_policy" "iam_managed_disableServiceAccountKeyCreation" {
  name   = "folders/${var.folder_id}/policies/iam.managed.disableServiceAccountKeyCreation"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      enforce = "TRUE"
    }
  }
}
