###tfvars###
variable "profile" {}
variable "region" {}
###tfvars###


terraform {
  backend "s3" {
    profile = "default"
    bucket  = "ceva-terraform.state"
    key     = "workload/terraform.tfstate"
    region  = "eu-west-1"
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
  shared_credentials_file = "/home/ubuntu/credential"
}

module "ec2" {
  source        = "./modules/ec2"
  sg_id = module.sg.sg_id
}

module "sg" {
  source = "./modules/sg"
}
