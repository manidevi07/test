variable "project_code" {
  description = "Provide the Project code"
  type        = string
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
  description = "Provide the purpose for this role"
  type        = string
  default     = null

}

variable "tier" {
  description = "Provide the purpose for this role"
  type        = string
  default     = null

}

variable "service_name" {
  description = "Provide the name of service which will use this role"
  type        = string

}

variable "description" {
  description = "Provide the description for this role"
  type        = string

}

variable "create_role" {
  description = "Role needs to be created or not. Valid values are TRUE or FALSE"
  type        = bool
  default     = true
  
}

variable "force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it. Defaults to false"
  default     = false
  type        = bool
}

variable "managed_policy_arns" {
  description = " Set of exclusive IAM managed policy ARNs to attach to the IAM role"
  type        = list(string)
  default     = null
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

variable "folder_name" {
  description = "Provide the name of folder where the policy is kept"
  type        = string
}

variable "file_name" {
  description = "Provide the name of policy file"
  type        = string
}