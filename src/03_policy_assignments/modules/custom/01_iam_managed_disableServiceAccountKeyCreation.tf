locals {
  iam_managed_disableServiceAccountKeyCreation = {
    prod-ict-513635 = {
      enforce = "FALSE"
    },
    organization-443016 = {
      enforce = "FALSE"
    },
  }
}

resource "google_org_policy_policy" "iam_managed_disableServiceAccountKeyCreation" {
  for_each = local.iam_managed_disableServiceAccountKeyCreation
  name     = "projects/${each.key}/policies/iam.managed.disableServiceAccountKeyCreation"
  parent   = "projects/${each.key}"

  spec {
    inherit_from_parent = false

    rules {
      enforce = each.value.enforce
    }
  }
}
