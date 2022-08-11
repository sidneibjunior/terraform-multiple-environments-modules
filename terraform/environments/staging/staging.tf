terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "terrafom-state-mode"
    key            = "staging/browser-api/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

locals {
  environment = "staging"
}

module "staging_dynamodb" {
  source             = "../../modules/database/dynamodb"
  dynamo_table_sufix = local.environment
  environment        = local.environment

  dynamodb_terraform_table_test = {
    billing_mode   = "PAY_PER_REQUEST"
    read_capacity  = null
    write_capacity = null
  }
}
