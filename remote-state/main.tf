terraform {
  required_version = "= 1.6.6"

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

resource "aws_dynamodb_table" "terraform_state_lock" {
    name = "project-state"
    read_capacity = 1
    write_capacity = 1
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
  
}