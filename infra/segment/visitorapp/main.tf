#################$VPC##########################################
resource "aws_vpc" "app" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc-${var.project_code}-${var.environment}${var.zone}"
    
  }
}
#################$APP SUBNET$###################################
resource "aws_subnet" "appsubnet" {
  for_each = var.app-subnet
  vpc_id = aws_vpc.app.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  map_public_ip_on_launch = true
  tags = {
    Name = "sub-${each.value.az_name}-${var.project_code}-${var.environment}${var.zone}${each.value.tier}"
    Subnet = "app"
  }
}

#################$DB SUBNET$################################
resource "aws_subnet" "dbsubnet" {
  for_each = var.db-subnet
  vpc_id = aws_vpc.app.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = "sub-${each.value.az_name}-${var.project_code}-${var.environment}${var.zone}${each.value.tier}"
    Subnet = "db"
  }
}

################$ ROUTE TABLE$################################
resource "aws_route_table" "rt-appsubnet" {
  vpc_id = aws_vpc.app.id
  tags = {
    Name = "rt-${var.project_code}-${var.environment}${var.zone}${var.tier}"
  }
}


resource "aws_route_table" "rt-dbsubnet" {
  vpc_id = aws_vpc.app.id
  tags = {
    Name = "rt-${var.project_code}-${var.environment}${var.zone}${var.tier}db"
  }
}

###############$ Internet Gateway$################################
resource "aws_internet_gateway" "this" {
  count  = 1
  vpc_id = aws_vpc.app.id
  tags = {
    Name = "igw-${aws_vpc.app.id}"
  }
}

resource "aws_route" "app_route_internet" {
  route_table_id         = aws_route_table.rt-appsubnet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}

###############$ ROUTE TABLE ASSOCIATION$################################
resource "aws_route_table_association" "rtb-appsubnet-association" {
  for_each = aws_subnet.appsubnet
  subnet_id = each.value.id
  route_table_id = aws_route_table.rt-appsubnet.id
}

resource "aws_route_table_association" "rtb-dbsubnet-association" {
  for_each = aws_subnet.dbsubnet
  subnet_id = each.value.id
  route_table_id = aws_route_table.rt-dbsubnet.id
}

###############$APP NACL$################################

resource "aws_network_acl" "appnacl" {
  vpc_id = aws_vpc.app.id
  subnet_ids = [for s in aws_subnet.appsubnet : s.id]
  dynamic "ingress" {
    for_each = var.app_nacl_ingress_rule
    content {
      rule_no = ingress.value["rule_number"]
      action = ingress.value["rule_action"]
      protocol = ingress.value["protocol"]
      cidr_block = ingress.value["cidr_block"]
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
    }
  }
  dynamic "egress" {
    for_each = var.app_nacl_egress_rule
    content {
      rule_no = egress.value["rule_number"]
      action = egress.value["rule_action"]
      protocol = egress.value["protocol"]
      cidr_block = egress.value["cidr_block"]
      from_port = egress.value["from_port"]
      to_port = egress.value["to_port"]
    }
  }
  tags = {
    Name = "nacl-${var.project_code}-${var.environment}${var.zone}${var.tier}"
  }
}

###############$DB NACL$################################

resource "aws_network_acl" "dbnacl" {
  vpc_id = aws_vpc.app.id
  subnet_ids = [for s in aws_subnet.dbsubnet : s.id]
  dynamic "ingress" {
    for_each = var.db_nacl_ingress_rule
    content {
      rule_no = ingress.value["rule_number"]
      action = ingress.value["rule_action"]
      protocol = ingress.value["protocol"]
      cidr_block = ingress.value["cidr_block"]
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
    }
  }
  dynamic "egress" {
    for_each = var.db_nacl_egress_rule
    content {
      rule_no = egress.value["rule_number"]
      action = egress.value["rule_action"]
      protocol = egress.value["protocol"]
      cidr_block = egress.value["cidr_block"]
      from_port = egress.value["from_port"]
      to_port = egress.value["to_port"]
    }
  }

  tags = {
    Name = "nacl-${var.project_code}-${var.environment}${var.zone}${var.tier}db"
  }
}

