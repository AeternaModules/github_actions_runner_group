resource "github_actions_runner_group" "actions_runner_groups" {
  for_each = var.actions_runner_groups

  name                       = each.value.name
  visibility                 = each.value.visibility
  allows_public_repositories = each.value.allows_public_repositories
  restricted_to_workflows    = each.value.restricted_to_workflows
  selected_repository_ids    = each.value.selected_repository_ids
  selected_workflows         = each.value.selected_workflows
}

