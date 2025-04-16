locals {
  dev-ai-io = {
    project_id  = "dev-ai-io-107243"
  }
}

resource "google_org_policy_policy" "dev-ai-io_resource_allowed_locations" {
  name   = "projects/${local.dev-ai-io.project_id}/policies/gcp.resourceLocations" # organization, folder or project
  parent = "projects/${local.dev-ai-io.project_id}"

  spec {
    inherit_from_parent = true

    rules {
      values {
        allowed_values = ["in:eu-locations"]
      }
    }
  }
}
