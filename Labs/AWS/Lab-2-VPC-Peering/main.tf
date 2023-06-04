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

// VPC
module "nyc-vpc" {
  source = "github.com/ajenehall/Terraform//AWS/modules/vpc"
  vpc-cidr-block = "10.0.0.0/16"
  vpc-name = "nyc-vpc"
  subnet-name = ["bronx"]
  subnet-cidr-block = ["10.0.1.0/24"]
  availability-zone = "us-east-1a"
}

module "fla-vpc" {
  source = "github.com/ajenehall/Terraform//AWS/modules/vpc"
  vpc-cidr-block = "10.1.0.0/16"
  vpc-name = "fla-vpc"
  subnet-name = ["fort-lauderdale"]
  subnet-cidr-block = ["10.1.1.0/24"]
  availability-zone = "us-east-1a"
}

// EC2 Instances
module "nyc-ec2" {
  depends_on = [
    module.nyc-vpc
  ]
  source = "github.com/ajenehall/Terraform//AWS/modules/ec2"
  key-pair-name = "nyc-key-pair"
  key-pair-rsa-bits = 4096
  key-pair-algorithm = "RSA"
  security-group-name = "main-sg"
  vpc-id = module.nyc-vpc.vpc-id[0]
  windows-instance-name = ["bronx-vm"]
  windows-instance-type = "t2.large"
  subnet-id = [module.nyc-vpc.subnet-id[0]]
}

module "fla-ec2" {
  depends_on = [
    module.fla-vpc
  ]
  source = "github.com/ajenehall/Terraform//AWS/modules/ec2"
  key-pair-name = "fla-key-pair"
  key-pair-rsa-bits = 4096
  key-pair-algorithm = "RSA"
  security-group-name = "main-sg"
  vpc-id = module.fla-vpc.vpc-id[0]
  windows-instance-name = ["fla-vm"]
  windows-instance-type = "t2.large"
  subnet-id = [module.fla-vpc.subnet-id[0]]
}

// Internet Gateways
module "nyc-igw" {
  depends_on = [
   module.nyc-vpc 
  ]
  source = "github.com/ajenehall/Terraform//AWS/modules/internet-gateway"
  vpc-id = module.nyc-vpc.vpc-id[0]
  subnet-id = [module.nyc-vpc.subnet-id[0]]
  internet-gateway-name = ["nyc-igw"]
  route-table-id = [module.nyc-vpc.route-table-id[0]]
}

module "fla-igw" {
  depends_on = [
   module.fla-vpc 
  ]
  source = "github.com/ajenehall/Terraform//AWS/modules/internet-gateway"
  vpc-id = module.fla-vpc.vpc-id[0]
  subnet-id = [module.fla-vpc.subnet-id[0]]
  internet-gateway-name = ["fla-igw"]
  route-table-id = [module.fla-vpc.route-table-id[0]]
}

// VPC Peering
module "vpc-peering" {
  depends_on = [
    module.nyc-vpc,
    module.fla-vpc
  ]
  source = "github.com/ajenehall/Terraform//AWS/modules/peerings"
  peer-vpc-id = module.fla-vpc.vpc-id[0]
  vpc-id = module.nyc-vpc.vpc-id[0]
  peering-connection-name = "NYC > FLA Peering"
  route-table-id = [module.fla-vpc.route-table-id[0], module.nyc-vpc.route-table-id[0]]
  destination-cidr = ["10.0.0.0/16", "10.1.0.0/16"]
}