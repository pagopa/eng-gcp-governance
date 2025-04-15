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

variable "folder_id_pagopa" {
  description = "FolderID Google Cloud"
  type        = string
  default     = "47551051631" # pagopa
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

variable "folder_id_dev" {
  description = "FolderID Google Cloud"
  type        = string
  default     = "286367851296" # dev
}

variable "folder_id_uat" {
  description = "FolderID Google Cloud"
  type        = string
  default     = "794602495691" # uat
}
variable "folder_id_prod" {
  description = "FolderID Google Cloud"
  type        = string
  default     = "797731740140" # prod
}