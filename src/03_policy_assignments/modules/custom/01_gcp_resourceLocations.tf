locals {
  gcp_resourceLocations = {
    dev-ai-io-107243 = {
      allowed_values = ["in:eu-locations"]
    },
    dev-ai-playground-01 = {
      allowed_values = ["in:eu-locations"]
    },
  }
}

resource "google_org_policy_policy" "gcp_resourceLocations" {
  for_each = local.gcp_resourceLocations
  name     = "projects/${each.key}/policies/gcp.resourceLocations"
  parent   = "projects/${each.key}"

  spec {
    inherit_from_parent = false

    rules {
      values {
        allowed_values = each.value.allowed_values
      }
    }
  }
}
