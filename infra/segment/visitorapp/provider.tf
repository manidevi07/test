terraform {
  #required_version > "1.2.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 4.25.0"
    }
  }
}

terraform {
  backend "s3" {
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
  profile = "default"
  default_tags {
    tags = {
      Project-code = var.project_code
      Environment  = var.environment
      #Tier         = var.tier
      #Zone         = var.zone
      Agency-code   = var.agency_code
      Create-method = var.create_method
    }
  }
}