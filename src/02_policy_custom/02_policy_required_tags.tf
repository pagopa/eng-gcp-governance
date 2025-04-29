resource "google_org_policy_custom_constraint" "must_have_tag_constraint" {
  parent          = "organizations/${var.organization_id}" 
  name            = "requiredTags" 
  display_name    = "requiredTags"
  description     = "This constraint ensures all resources have the required 'environment' tag."
  action_type     = "ALLOW"
  resource_types  = ["*"]
  method_types    = ["CREATE", "UPDATE"] 

  condition = "resource.matchTag('tagKeys/environment', 'tagValues/*')" 
}
