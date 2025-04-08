# Role "roles/orgpolicy.policyAdmin"
# Enable API: gcloud services enable orgpolicy.googleapis.com --project="$PROJECT_ID"

resource "google_org_policy_policy" "resource_allowed_locations" {
  name   = "folders/${var.folder_id}/policies/gcp.resourceLocations" # organization, folder or project
  parent = "folders/${var.folder_id}"

  spec {
    inherit_from_parent = false

    rules {
      values {
        allowed_values = ["in:eu"]
      }
    }
  }
}

module "module_allowed_locations" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "7.0.0"

  policy_root    = "folder" # organization, folder or project
  policy_root_id = var.folder_id
  constraint     = "constraints/gcp.resourceLocations"
  policy_type    = "list"

  rules = [
    {
      enforcement = null
      allow       = ["in:eu"]
    }
  ]
}