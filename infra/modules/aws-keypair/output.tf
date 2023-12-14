###################OUTPUT#########################################

output "keypair_name" {
  value = try(aws_key_pair.server[0].key_name, "")
}

output "keypair_arn" {
  value = try(aws_key_pair.server[0].arn, "")
}

output "key_pair_fingerprint" {
  value = try(aws_key_pair.server[0].fingerprint, "")
}

output "private_key_pem" {
  value = try(tls_private_key.tls_key[0].private_key_pem, "")
}

