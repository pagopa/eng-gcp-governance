module "prod_assignments" {
  source = "./modules/prod"

  folder_id = var.folder_id_prod
}