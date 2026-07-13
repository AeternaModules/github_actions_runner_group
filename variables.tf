variable "actions_runner_groups" {
  description = <<EOT
Map of actions_runner_groups, attributes below
Required:
    - name
    - visibility
Optional:
    - allows_public_repositories
    - restricted_to_workflows
    - selected_repository_ids
    - selected_workflows
EOT

  type = map(object({
    name                       = string
    visibility                 = string
    allows_public_repositories = optional(bool)
    restricted_to_workflows    = optional(bool)
    selected_repository_ids    = optional(set(number))
    selected_workflows         = optional(list(string))
  }))
  # --- Unconfirmed validation candidates, derived from github_actions_runner_group's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: visibility
  #   condition: contains(["all", "selected", "private"], value)
  #   message:   must be one of: all, selected, private
}

