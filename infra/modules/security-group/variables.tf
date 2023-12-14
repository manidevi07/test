variable "project_code" {
  type        = string
  description = "Specify the project code for the resources"
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
variable "zone" {
  type        = string
  description = "Specify the zone name for the resources"
}
variable "tier" {
  type        = string
  description = "Specify the tier name for the resources"
}

variable "create_sg" {
  type        = bool
  description = "Specify the value (True/False) whether security group needs to be created or not"
  default     = true
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "Specify the vpc id for security group"
}

variable "function_name" {
  type        = string
  description = "Specify the purpose for security group"
}

variable "security_group_rules" {
  description = "Specify the security group inbound/outbound rules"
  default     = {}
}

variable "ignore_changes" {
  type        = list(string)
  description = "Specify the type of rules(inbound/outbound) which needs to be ignored on next apply if changed outside of terraform."
  default     = []
}