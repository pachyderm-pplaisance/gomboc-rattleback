terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional (for HCP Terraform): uncomment + fill in
  # cloud {
  #   organization = "YOUR_ORG"
  #   workspaces { name = "dolphinscheduler-drift-demo" }
  # }
}

provider "aws" {
  region = "us-east-1"
}
