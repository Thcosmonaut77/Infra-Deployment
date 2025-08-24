terraform {
  required_version = "= 1.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.7.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "trippy-project-tfstate"
    force_destroy = true                                    # testing or practice

    lifecycle {
      prevent_destroy = false                                # testing or practice
    }
  
}

resource "aws_s3_bucket_versioning" "terraform_state" {
    bucket = aws_s3_bucket.terraform_state.id

    versioning_configuration {
      status = "Enabled"
    }
  
}

