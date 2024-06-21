output "workspace_properties" {
  description = "Map of the workspace properties"
  value = {
    name     = tfe_workspace.workspace.name
    id       = tfe_workspace.workspace.id
    html_url = tfe_workspace.workspace.html_url
  }
}
