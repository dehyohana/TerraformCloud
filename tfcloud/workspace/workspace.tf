resource "tfe_workspace" "workspace" {
  project_id  = var.project_id
  name        = var.name
  description = var.description

  allow_destroy_plan  = var.allow_destroy_plan
  auto_apply          = var.auto_apply
  speculative_enabled = var.speculative_enabled
  queue_all_runs      = false

  global_remote_state       = var.global_remote_state
  remote_state_consumer_ids = var.remote_state_consumer_ids

  dynamic "vcs_repo" {
    for_each = var.vcs_repo != null ? { vcs_worklow_enabled = true } : {}

    content {
      identifier                 = var.vcs_repo.identifier
      github_app_installation_id = var.vcs_repo.github_app_installation_id
      branch                     = var.vcs_repo.branch
      tags_regex                 = var.vcs_repo.tags_regex
      ingress_submodules         = var.vcs_repo.ingress_submodules
    }
  }

  working_directory = var.working_directory
  trigger_patterns  = var.trigger_patterns

  tag_names = var.tag_names
}
