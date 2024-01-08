terraform {
  backend "s3" {
    bucket = "lgai-spotlight-terraform"
    key    = "state/terraform.tfstate"
    region = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Environment = "dev"
      Terraform   = "true"
      Project     = "lgai-spotlight"
    }
  }
}

module "client_website_deployment_bucket" {
  source      = "../client/terraform"
  environment = var.environment
}
