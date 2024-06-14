terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket = "lama-bucket-workshop"
    key    = "statefile.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

