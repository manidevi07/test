resource "aws_iam_role" "role" {
  name                  = "iam-role-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.service_name}"
  count                 = var.create_role ? 1 : 0
  description           = var.description
  force_detach_policies = var.force_detach_policies
  managed_policy_arns   = var.managed_policy_arns
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  assume_role_policy    = file("../../config/${var.folder_name}/${var.file_name}.json")
  tags = {
    "zone" = var.zone
    "tier" = var.tier
  }

}