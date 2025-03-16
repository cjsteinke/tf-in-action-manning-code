variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}


variable "ssh_keypair" {
  description = "SSH keyair to use for EC2 instances"
  default     = null
  type        = string
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-2"
  type        = string
}


