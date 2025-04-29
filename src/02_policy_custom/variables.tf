variable "organization_id" {
  type = string
  default = "520838205140"
}

variable "project_id" {
  description = "ProjectID Google Cloud"
  type        = string
  default     = "organization-443016"
}

variable "region" {
  description = "Region Google Cloud"
  type        = string
  default     = "europe-west8"
}

variable "zone" {
  description = "Zone Google Cloud"
  type        = string
  default     = "europe-west8-a"
}
