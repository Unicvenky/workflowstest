# Each Terraform module must declare which providers it requires, so that Terraform can install and use them.
# Provider requirements are declared in a required_providers block.
# A provider requirement consists of a local name, a source location, and a version constraint:
terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.61"
    }
  }
}
