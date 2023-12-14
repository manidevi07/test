resource "aws_security_group" "sg" {
	# checkov:skip=CKV2_AWS_5: ADD REASON
	count       = var.create_sg ? 1 : 0
  name        = "sgrp-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.function_name}"
  description = "security group for ${var.function_name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.security_group_rules["ingress"]
    content {
      description      = lookup(ingress.value, "description", null)
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      security_groups  = lookup(ingress.value, "security_groups", null)
      prefix_list_ids  = lookup(ingress.value, "prefix_list_ids", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      self             = lookup(ingress.value, "self", false)
    }
  }

  dynamic "egress" {
    for_each = var.security_group_rules["egress"]
    content {
      description      = lookup(egress.value, "description", null)
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = lookup(egress.value, "cidr_blocks", null)
      security_groups  = lookup(egress.value, "security_groups", null)
      prefix_list_ids  = lookup(egress.value, "prefix_list_ids", null)
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
      self             = lookup(egress.value, "self", false)
    }
  }
  # lifecycle {
  #  ignore_changes = [ingress,egress]
  # }
  tags = {
    "Name" = "sgrp-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.function_name}"
    "zone" = var.zone
    "tier" = var.tier
  }
}
