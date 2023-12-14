resource "aws_secretsmanager_secret" "secret_manager" {
  count = var.create_sm ? 1 : 0
  name                    = "SVC-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.name}"
  #kms_key_id              = var.kms_key_arn
  description             = var.description
  recovery_window_in_days = var.recovery_window_in_days
  tags = {
    Name = "SVC-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.name}"
  }
}

resource "aws_secretsmanager_secret_rotation" "secret_rotate" {
  count               = var.rotation ? 1 : 0
  secret_id           = aws_secretsmanager_secret.secret_manager[0].id
  rotation_lambda_arn = var.rotation_lambda_arn

  rotation_rules {
    automatically_after_days = var.automatically_after_days
  }
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  count = var.create_sm ? 1 : 0
  secret_id     = aws_secretsmanager_secret.secret_manager[0].id
  secret_string = jsonencode(var.secret_string)
}

data "aws_caller_identity" "current" {}
locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_secretsmanager_secret_policy" "secrets_policy" {
  count = var.create_sm ? 1 : 0
  secret_arn = aws_secretsmanager_secret.secret_manager[0].arn
  policy = templatefile("${("../../config/${var.folder_name}/${var.file_name}.json")}",
    {
      account_id   = "${local.account_id}",
      resource_arn = "${aws_secretsmanager_secret.secret_manager[0].arn}",
      env  = "${var.environment}",
      zone = "${var.zone}",
      tier = "${var.tier}"
  })
}



