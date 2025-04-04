variable "organization_id" {
  description = "ID della org GCP"
  type        = string
  default     = "520838205140"
}

variable "customer_id" {
  description = "CustomerID Google Cloud"
  type        = string
  default     = "C00siwdxu"
}

variable "domain" {
  description = "Dominio Google Workspace (ad esempio, mycompany.com)"
  type        = string
  default     = "pagopa.it"
}

variable "project_id" {
  description = "ID del progetto GCP"
  type        = string
  default     = "organization-443016"
}

variable "region" {
  description = "Regione GCP"
  type        = string
  default     = "europe-west8"
}

variable "zone" {
  description = "Zona GCP"
  type        = string
  default     = "europe-west8-a"
}
