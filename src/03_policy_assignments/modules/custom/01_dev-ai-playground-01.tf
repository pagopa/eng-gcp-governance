locals {
  dev-ai-playground-01 = {
    project_id  = "dev-ai-playground-01"
  }
}

resource "google_org_policy_policy" "dev-ai-playground-01_resource_allowed_locations" {
  name   = "projects/${local.dev-ai-playground-01.project_id}/policies/gcp.resourceLocations" # organization, folder or project
  parent = "projects/${local.dev-ai-playground-01.project_id}"

  spec {
    inherit_from_parent = true

    rules {
      values {
        allowed_values = ["in:eu-locations"]
      }
    }
  }
}
