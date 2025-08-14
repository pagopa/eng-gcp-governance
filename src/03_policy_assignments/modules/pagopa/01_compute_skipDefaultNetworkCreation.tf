resource "google_org_policy_policy" "compute_skipDefaultNetworkCreation" {
  name   = "folders/${var.folder_id}/policies/compute.skipDefaultNetworkCreation"
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      enforce = "TRUE"
    }
  }
}
