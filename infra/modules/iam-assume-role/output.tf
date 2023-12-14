output "role_arn" {
  value = try(aws_iam_role.role[0].arn, "")
  
}

output "role_id" {
  value = try(aws_iam_role.role[0].id, "")
}

output "role_name" {
  value = try(aws_iam_role.role[0].name, "")
}