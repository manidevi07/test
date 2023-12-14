output "output" {
  description = "Secret manager attributes"
  sensitive   = true
  value = {
    secret  = try(aws_secretsmanager_secret.secret_manager[0], "")
    version = try(aws_secretsmanager_secret_version.secret_version[0], "")
  }
}

output "secret_arn" {
  value = try(aws_secretsmanager_secret.secret_manager[0].arn, "")
}