locals {
  iam_managed_disableServiceAccountKeyCreation = {
    prod-ict-513635 = {
      enforce = "FALSE"
    },
    organization-443016 = {
      enforce = "FALSE" # delete when service account will be migrated to prod-ict-513635
    },
    dev-ai-playground-01 = {
      enforce = "FALSE"
    },
    dev-devportal = {
      enforce = "FALSE"
    },
    dev-ai-mailsage-554949 = {
      enforce = "FALSE"
    },
    uat-devportal-093525 = {
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
