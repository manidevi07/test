
variable "env" {
  description = "name of env"
  type        = string
}
variable "region" {
  description = "Region nmae"
  type        = any
  default     = "ap-southeast-1"
}
variable "tier" {
  description = "tier name"
  type        = any
  default     = {}
}
variable "agency_code" {
  description = "agency code"
  type        = any
  default     = {}
}
variable "project_code" {
  description = "project code"
  type        = any
  default     = {}
}
variable "zone" {
  description = "zone name"
  type        = any
  default     = {}
}
variable "create_method" {
  description = "creation method"
  type        = any
  default     = {}
}
variable "vmname" {
  description = "vmname"
  type        = string
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

variable "create_keypair" {
    description = "Do we need to create keypair"
    type        = bool
    default     = true
}