resource "google_binary_authorization_attestor_iam_binding" "binary_authorization_attestor_iam_bindings" {
  for_each = var.binary_authorization_attestor_iam_bindings

  attestor = each.value.attestor
  members  = each.value.members
  role     = each.value.role
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

