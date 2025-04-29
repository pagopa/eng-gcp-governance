resource "google_org_policy_policy" "required_tags" {
  name   = "folders/${var.folder_id}/policies/requiredTags"
  parent = "folders/${var.folder_id}"

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}