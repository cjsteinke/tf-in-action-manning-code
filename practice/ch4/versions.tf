terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.84"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.3"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.5"
    }
  }
}
