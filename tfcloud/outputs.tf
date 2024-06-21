output "dev_project" {
  value = module.dev_project.project_id
}

output "qa_project" {
  value = module.qa_project.project_id
}

output "prod_project" {
  value = module.prod_project.project_id
}

output "workspaces" {
  description = "List of workspace properties"
  value = [
    module.dev_infrastructure.workspace_properties
  ]
}
