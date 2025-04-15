module "prod_assignments" {
  source = "./modules/dev"

  folder_id = var.folder_id_prod
}