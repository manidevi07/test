variable "vpc_cidr" {
  type = string
  default = "100.120.108.0/22"
}

variable "project_code" {
  type = string
  default = "app"
}

variable "environment" {
  type        = string
  description = <<EOT
    (Optional)  The name of the environment where the resources will be deployed.
 
    Options:
      - dev
      - uat
      - stg
      - prd
      - dso
      - mgt
 
    Default: dev
  EOT
 
  default = "dev"
}

variable "tier" {
  type = string
}

variable "zone" {
  type = string
}

variable "agency_code" {
  type = string
  default = "test"
}

variable "create_method" {
  type = string
  default = "iac-terraform"
}

variable "app-subnet" {
  type = map(object({
    cidr = string
    az   = string
    az_name = string
    tier = string
  }))
  description = "Create Subnets for My VPC"
}

variable "db-subnet" {
  type = map(object({
    cidr = string
    az   = string
    az_name = string
    tier = string
  }))
  description = "Create Subnets for My VPC"
}



variable "folder_name" {
  type        = string
  description = "Specify the folder name of the segment"
  default = "app_internet"
}

variable "policyfile_name_ecr" {
  type        = string
  description = "Specify the name of policyfile for kms"
}

variable "policyfile_name_redis" {
  type        = string
  description = "Specify the name of policyfile for kms"
}

variable "app_nacl_ingress_rule" {
  description = "ingress rule"
  type        = list(object({
    rule_number = number
    protocol  = string
    rule_action = string
    cidr_block = string
    from_port = number
    to_port   = number
  }))
}

variable "app_nacl_egress_rule" {
  description = "egress rule"
  type        = list(object({
    rule_number = number
    protocol  = string
    rule_action = string
    cidr_block = string
    from_port = number
    to_port   = number
  }))
}

variable "db_nacl_ingress_rule" {
  description = "ingress rule"
  type        = list(object({
    rule_number = number
    protocol  = string
    rule_action = string
    cidr_block = string
    from_port = number
    to_port   = number
  }))
}

variable "db_nacl_egress_rule" {
  description = "egress rule"
  type        = list(object({
    rule_number = number
    protocol  = string
    rule_action = string
    cidr_block = string
    from_port = number
    to_port   = number
  }))
}

variable "function_name" {
  type = string 
}

variable "security_group_rules" {
  description = "Specify the security group inbound/outbound rules"
  default     = {}
}

/*
variable "routes_appsubnet" {
  type = any
}

variable "routes_dbsubnet" {
  type = any
}*/
#################### EKS #########################

variable "cluster_version" {
    description = "cluster version"
    type        = string
    default     = ""
}

variable "ami_id" {
    description = "instance ami-id"
    type        = string
    default     = ""
}
variable "instance_type" {
    description = "instance type"
    type        = string
    default     = ""
}

variable "volume_size" {
    description = "insttance root volume size"
    type        = number
}


variable "cluster" {
    description = "cluster count"
    type        = string
}

variable "coredns_version" {
    description = "coredns version"
    type        = string
}

variable "vpccni_version" {
    description = "vpccni version"
    type        = string
}

variable "kubeproxy_version" {
    description = "kubeproxy version"
    type        = string
}

variable "ebs_csi_driver_version" {
    description = "ebs csi driver version"
    type        = string
}


##################IAM roles#########


variable "resource" {
    description = "Provide the purpose for this role"
    type        = string
     
}

variable "service_name1" {
    description = "Provide the name of service which will use this role"
    type        = string
     
}


variable "service_name2" {
    description = "Provide the name of service which will use this role"
    type        = string
     
}


variable "description" {
    description = "Provide the description for this role"
    type        = string
    default     = "role for eks  cluster"
}

variable "force_detach_policies" {
    description = "Whether to force detaching any policies the role has before destroying it. Defaults to false"
    default     = false
    type        = bool  
}

variable "managed_policy_arns" {
    description = " Set of exclusive IAM managed policy ARNs to attach to the IAM role"
    type        = list(string)  
}

variable "managed_policy_arns_nodes" {
    description = " Set of exclusive IAM managed policy ARNs to attach to the IAM role"
    type        = list(string)  
}

variable "max_session_duration" {
    type        = number
    description = "Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours"
    default     = 3600
}

variable "permissions_boundary" {
    type        = string
    description = "ARN of the policy that is used to set the permissions boundary for the role"
    default     = ""
}


variable "role_policy_file_name_eks" {
    description = "Provide the name of policy file"
    type        = string
}

variable "role_policy_file_name_nodes" {
    description = "Provide the name of policy file"
    type        = string
}
###########Security Group

variable "security_group_rules_albcontroller" {
  description = "Specify the security group inbound/outbound rules"
  default     = {}
}

variable "security_group_rules_eks_master" {
  description = "Specify the security group inbound/outbound rules"
  default     = {}
}

variable "security_group_rules_eks_worker" {
  description = "Specify the security group inbound/outbound rules"
  default     = {}
}

######key-pair#########
variable "vmname" {
  description = "vmname"
  type        = string
}

#########ecr#####################

variable "attach_repository_policy" {
  type        = bool
  default     = false
  description = "Specify whether to attach policy to ecr repo or not"
}

variable "create_lifecycle_policy" {
  type        = bool
  default     = false
  description = "Specify whether to create lifecycle policy to ecr repo"
}

/*
variable "repo_name" {
  type        = string
  description = "Specify the name suffix for the ecr repositories"
}



variable "repository_policyfile_name" {
  type        = string
  description = "Specify the name of repository policyfile for ecr"
}*/

variable "lifecycle_policyfile_name" {
  type        = string
  description = "Specify the name of lifecycle policyfile for ecr"
}

variable "algorithm" {
  description = "KEY ALGO"
  type        = string
  default     = "RSA" 
}

variable "rsa_bits" {
  description = "RSA_BITS for KEY"
  type        = string
  default     = "4096"
}

variable "rotation" {
  type        = bool
  description = "enable if secret rotation needed"
  default = false
} 

variable "rotation_lambda_arn" {
  type        = string
  default     = null
  description = "Lambda ARN"
}

variable "desired_size" {
    description = "desired instance count of node-group"
    type        = number
    default     = 1
}

variable "max_size" {
    description = "max instance count of node-group"
    type        = number
    default     = 1
}

variable "min_size" {
    description = "min instance count of node-group"
    type        = number
    default     = 1
}

variable "create_ng3" {
  type        = bool
  description = "Specify whether to create cluster or not"
  default     = false
}

variable "file_name_policy_sm" {
  type        = string
  description = "please enter file name for secret-policy"
}

variable "description_secret" {
  type        = string
  default = "Secret to store private-key for eks"
}
