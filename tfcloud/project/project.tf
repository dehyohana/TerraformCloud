resource "tfe_project" "project" {
  organization = var.TFE_ORGANIZATION
  name         = var.tfe_project_name
}
