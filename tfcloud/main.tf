module "dev_project" {
  source = "./project"

  TFE_ORGANIZATION = var.TFE_ORGANIZATION
  TFE_TOKEN        = var.TFE_TOKEN
  tfe_project_name = "Development"
}

module "qa_project" {
  source = "./project"

  TFE_ORGANIZATION = var.TFE_ORGANIZATION
  TFE_TOKEN        = var.TFE_TOKEN
  tfe_project_name = "Tests"
}

module "prod_project" {
  source = "./project"

  TFE_ORGANIZATION = var.TFE_ORGANIZATION
  TFE_TOKEN        = var.TFE_TOKEN
  tfe_project_name = "Production"
}

#Infrastructure workspace
module "dev_infrastructure" {
  source = "./workspace"

  project_id                = module.dev_project.project_id
  name                      = "dev-infra"
  description               = "Create development workspace environment"
  allow_destroy_plan        = true
  auto_apply                = false
  speculative_enabled       = true
  global_remote_state       = false
  remote_state_consumer_ids = []

  vcs_repo = {
    identifier                 = local.github_identifier
    github_app_installation_id = local.github_app_installation_id
    branch                     = "main"
    tags_regex                 = null
    ingress_submodules         = true
  }
  working_directory = "aws"
  trigger_patterns  = ["aws/**/*.tf"]

  workspace_variables = [
    {
      description = "description1"
      key         = "key1"
      value       = ""
      sensitive   = false
    },
    {
      description = "description2"
      key         = "key2"
      value       = ""
      sensitive   = false
    }
  ]
}
