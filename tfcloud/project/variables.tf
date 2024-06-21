#TFCloud vars
variable "TFE_TOKEN" {
  description = "TF Cloud token"
  type        = string
  sensitive   = true
}

variable "TFE_ORGANIZATION" {
  description = "TF Cloud organization"
  type        = string
}

variable "tfe_project_name" {
  description = "Project name to be created in TF Cloud"
  type        = string
}
