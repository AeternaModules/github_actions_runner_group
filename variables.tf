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
  validation {
    condition = alltrue([
      for k, v in var.actions_runner_groups : (
        contains(["all", "selected", "private"], v.visibility)
      )
    ])
    error_message = "must be one of: all, selected, private"
  }
}

