terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "terrafom-state-mode"
    key            = "production/browser-api/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

locals {
  environment = "production"
}

module "production_dynamodb" {
  source             = "../../modules/database/dynamodb"
  dynamo_table_sufix = "prod"
  environment        = local.environment

  dynamodb_terraform_table_test = {
    billing_mode   = "PROVISIONED"
    read_capacity  = 1
    write_capacity = 2
  }
}
