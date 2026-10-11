variable "binary_authorization_attestor_iam_bindings" {
  description = <<EOT
Map of binary_authorization_attestor_iam_bindings, attributes below
Required:
    - attestor
    - members
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    attestor = string
    members  = set(string)
    role     = string
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

