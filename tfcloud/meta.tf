data "tfe_workspace" "tf_cloud" {
  name = "setup"
}

locals {
  github_identifier          = data.tfe_workspace.tf_cloud.vcs_repo[0].identifier
  github_app_installation_id = data.tfe_workspace.tf_cloud.vcs_repo[0].github_app_installation_id
}
