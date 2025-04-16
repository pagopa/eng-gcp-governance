resource "google_org_policy_policy" "resource_allowed_locations" {
  name   = "folders/${var.folder_id}/policies/gcp.resourceLocations" # organization, folder or project
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      values {
        allowed_values = [
          "in:it-locations",           # italy
          "in:de-locations",           # germany
          "in:europe-west1-locations", # belgium
        ]
      }
    }
  }
}
