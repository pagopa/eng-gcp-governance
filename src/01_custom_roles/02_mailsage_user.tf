resource "google_organization_iam_custom_role" "pagopa_mailsage_user" {
  role_id     = "pagopa_mailsage_user"
  org_id      = var.organization_id
  title       = "PagoPA MailSage User Role"
  description = "User role used by MailSage project"
  permissions = ["aiplatform.endpoints.predict"]
}