data "aws_caller_identity" "current" {}

data "aws_subnets" "app_subnets" {
  filter {
    name   = "tag:Subnet"
    values = ["app"] # insert values here
  }
}
##########eks-dev-internetapp##############
/*
module "iam_role_eks" {
    source                      = "../../modules/iam-assume-role"
    project_code                = var.project_code
    environment                 = var.environment
    #resource                    = var.resource
    service_name                = var.service_name1
    description                 = var.description
    force_detach_policies       = var.force_detach_policies
    managed_policy_arns         = var.managed_policy_arns
    max_session_duration        = var.max_session_duration
    permissions_boundary        = var.permissions_boundary
    folder_name                 = var.folder_name 
    file_name                   = var.role_policy_file_name_eks
    zone                        = var.zone
    tier                        = var.tier
}

module "iam_role_nodes" {
    source                      = "../../modules/iam-assume-role"
    project_code                = var.project_code
    environment                 = var.environment
    #resource                    = var.resource
    service_name                = var.service_name2
    description                 = var.description
    force_detach_policies       = var.force_detach_policies
    managed_policy_arns         = var.managed_policy_arns_nodes
    max_session_duration        = var.max_session_duration
    permissions_boundary        = var.permissions_boundary
    folder_name                 = var.folder_name 
    file_name                   = var.role_policy_file_name_nodes
    zone                        = var.zone
    tier                        = var.tier
}

#module.iam_role_eks.role_arn

module "eksmaster_security_group" {
  source                            = "../../modules/security-group"
  project_code                      = var.project_code
  environment                       = var.environment
  zone                              = var.zone
  tier                              = var.tier
  vpc_id                            = aws_vpc.app.id
  function_name                     = "eks01-master"
  security_group_rules              = var.security_group_rules_eks_master
}


module "eksworker_security_group" {
  source                            = "../../modules/security-group"
  project_code                      = var.project_code
  environment                       = var.environment
  zone                              = var.zone
  tier                              = var.tier
  vpc_id                            = aws_vpc.app.id
  function_name                     = "eks01-worker" ##var.function_name
  security_group_rules              = var.security_group_rules_eks_worker
}


module "keypair" {
  source       = "../../modules/aws-keypair"
  algorithm    = var.algorithm
  rsa_bits     = var.rsa_bits
  tier         = var.tier
  zone         = var.zone
  project_code = var.project_code
  env          = var.environment
  vmname       = var.vmname
}

module "secret_manager" {
  source                  = "../../modules/secrets-manager"
  tier                    = var.tier
  zone                    = var.zone
  project_code            = var.project_code
  environment             = var.environment
  name                    = join("-",[var.vmname,"01"])
  rotation                = var.rotation
  rotation_lambda_arn     = var.rotation_lambda_arn
  secret_string = local.secret_string
  file_name     = var.file_name_policy_sm
  description   = var.description_secret
  folder_name   = var.folder_name
}

locals {
  secret_string = {
    
    "key" : module.keypair.private_key_pem

  }
}
*/
####
module "eks" {
  source                           = "../../modules/eks"
  name                             = join("-", [var.project_code,"${var.environment}${var.zone}${var.tier}"])
  cluster_version                  = var.cluster_version
  vpc_id                           = aws_vpc.app.id
  subnet_ids                       = data.aws_subnets.app_subnets.ids
  tier                             = var.tier
  agency_code                      = var.agency_code
  project_code                     = var.project_code
  zone                             = var.zone
  create_method                    = var.create_method
  env                              = var.environment
  depends_on = [module.iam_role_nodes, module.iam_role_eks]
}
