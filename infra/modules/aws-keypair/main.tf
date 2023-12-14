# Key pair 
resource "tls_private_key" "tls_key" {
  count       = var.create_keypair ? 1 : 0
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "server" {
  count       = var.create_keypair ? 1 : 0
  key_name = "key-${var.project_code}-${var.env}${var.zone}${var.tier}-${var.vmname}"
  public_key = tls_private_key.tls_key[0].public_key_openssh

  tags = {
    "tier" = var.tier
    "zone" = var.zone
  }
}

