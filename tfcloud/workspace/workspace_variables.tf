resource "tfe_variable" "workspace_variables" {
  for_each = { for v in var.workspace_variables : v.key => v }

  workspace_id = tfe_workspace.workspace.id
  category     = "terraform"
  description  = each.value.description
  key          = each.value.key
  value        = each.value.value
  sensitive    = each.value.sensitive

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
