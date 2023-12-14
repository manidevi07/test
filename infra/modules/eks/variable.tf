variable "name" {
    description = "cluster name"
    type        = string
}

variable "cluster_version" {
    description = "cluster version"
    type        = string
}

variable "vpc_id" {
    description = "vpc id"
    type        = string
}
variable "subnet_ids" {
    description = "subnet ids"
    type        = any
}
variable "tier" {
    description = "tier"
   type        = string 
}
variable "agency_code" {
    description = "agency code"
   type        = string 
}
variable "project_code" {
    description = "project code"
   type        = string 
}
variable "zone" {
    description = "zone"
   type        = string 
}
variable "create_method" {
    description = "create method"
   type        = string 
}
variable "env" {
  description = "name of env"
  type        = string
}