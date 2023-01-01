/*
 * provider.tf
 * 
 */

 provider "aws" {
  //shared_config_files      = ["/Users/csteinke/.aws/conf"]
  region                   = "us‑east‑2"
  //shared_credentials_files = ["/Users/csteinke/.aws/credentials"]
  //profile                  = "spiffspace"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-state"
    key            = "terraform-in-action.tfstate"
    region         = "us-east-2"
  }
