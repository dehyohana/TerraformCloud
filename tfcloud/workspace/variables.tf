variable "project_id" {
  type        = string
  description = "Project id"
}

variable "name" {
  type        = string
  description = "Workspace name"
}

variable "description" {
  type        = string
  description = "Workspace description"
}

variable "allow_destroy_plan" {
  type        = bool
  description = "Allow destroy plan in the workspace"
  default     = true
}

variable "auto_apply" {
  type        = bool
  description = "Enable auto apply for the workspace"
  default     = false
}

variable "speculative_enabled" {
  type        = bool
  description = "Enable speculative plans for pull request validations"
  default     = true
}

variable "global_remote_state" {
  type        = bool
  description = "Enable global state sharing of this workspace"
  default     = false
}

variable "remote_state_consumer_ids" {
  type        = list(string)
  description = "List of workspaces to share the state of this workspace"
  default     = []
}

variable "vcs_repo" {
  description = "Properties of vcs workflow configuration"
  type = object({
    identifier                 = string
    github_app_installation_id = string
    branch                     = string
    tags_regex                 = string
    ingress_submodules         = bool
  })
  default = null
}

variable "working_directory" {
  type        = string
  description = "Working directory for the workspace"
  default     = null
}

variable "trigger_patterns" {
  type        = list(string)
  description = "List of path patterns to trigger runs on the workspace"
  default     = []
}

variable "tag_names" {
  type        = set(string)
  description = "Tags for the workspace"
  default     = []
}

variable "workspace_variables" {
  description = "Variables to be created in the workspace"
  type = list(object({
    description = string
    key         = string
    value       = string
    sensitive   = bool
  }))
  default = []
}
