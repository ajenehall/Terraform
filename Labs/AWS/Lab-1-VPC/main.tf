terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.41.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

module "vpc" {
  source = "github.com/ajenehall/Terraform//AWS/modules/vpc"
  vpc-cidr-block = "10.0.0.0/16"
  vpc-name = "vpc-1"
  subnet-name = ["bronx"]
  subnet-cidr-block = ["10.0.1.0/24"]
  availability-zone = "us-east-1a"
}