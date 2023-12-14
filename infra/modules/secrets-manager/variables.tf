variable "project_code" {
  type        = string
  description = "enter project code"
}
variable "environment" {
  type        = string
  description = "enter deatils of env "
}
variable "zone" {
  type        = string
  description = "enter zone details"
}
variable "tier" {
  type        = string
  description = "enter tier details"
}

variable "name" {
  type        = string
  description = "enter secret name for which will be created for"
}
/*
variable "kms_key_arn" {
  type        = string
  default     = null
  description = "Customer Master Key Id to be used to encrypt the secrets values"
}*/

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the secret."
}

variable "recovery_window_in_days" {
  type        = number
  default     = 10
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
}

variable "rotation_lambda_arn" {
  type        = string
  default     = null
  description = "Lambda ARN"
}
variable "automatically_after_days" {
  type        = number
  default     = 30
  description = "Specifies the number of days between automatic scheduled rotations of the secret."
}

variable "rotation" {
  type    = bool
  default = true
}

variable "secret_string" {
  type        = map(any)
  description = "enter parameters to store in secret manager"
}


variable "file_name" {
  type        = string
  description = "filename of the policy to be used for Secret Manager"
}

variable "folder_name" {
  type        = string
  description = "folder name of the target config dir"
}

variable "create_sm" {
  type    = bool
  default = true
}
