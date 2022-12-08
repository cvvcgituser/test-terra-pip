# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "4.45.0"
#     }
#   }
# }

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
}

module "networking" {
  source                = "../modules/networking"
  vpc_cidr_block        = "10.0.0.0/16"
  vpc_name              = "three-tier"
  websubnet1_cidr_block = "10.0.1.0/24"
  websubnet1_az         = "us-east-1a"
  websubnet1_nametag    = "websubnet1a"
  websubnet2_cidr_block = "10.0.2.0/24"
  websubnet2_az         = "us-east-1b"
  websubnet2_nametag    = "websubnet1b"
  appsubnet1_cidr_block = "10.0.11.0/24"
  appsubnet1_az         = "us-east-1a"
  appsubnet1_nametag    = "appsubnet1a"
  appsubnet2_cidr_block = "10.0.12.0/24"
  appsubnet2_az         = "us-east-1b"
  appsubnet2_nametag    = "appsubnet1b"
  dbsubnet1_cidr_block  = "10.0.21.0/24"
  dbsubnet1_az          = "us-east-1a"
  dbsubnet1_nametag     = "dbsubnet1a"
  dbsubnet2_cidr_block  = "10.0.22.0/24"
  dbsubnet2_az          = "us-east-1b"
  dbsubnet2_nametag     = "dbsubnet1b"
  igw_nametag           = "IGW-3TIER"
  route_cidr_block      = "0.0.0.0/0"
  webrt_nametag         = "WEB-ROUTE-TABLE"
}

module "webservers" {
  source                   = "../modules/webservers"
  webserver1_ami_id        = "ami-0d5eff06f840b45e9"
  webserver1_instance_type = "t2.micro"
  webserver1_az            = "us-east-1a"
  webserver1_sg            = module.securitygroups.webserver-sg.id
  webserver1_subnet_1      = module.networking.subnet-id-1.id
  webserver1_nametag       = "WEBSERVER1"
  webserver2_ami_id        = "ami-0d5eff06f840b45e9"
  webserver2_instance_type = "t2.micro"
  webserver2_az            = "us-east-1b"
  webserver2_nametag       = "WEBSERVER2"
  webserver2_subnet_2      = module.networking.subnet-id-2.id
}

module "securitygroups" {
  source               = "../modules/securitygroups"
  vpc_id               = module.networking.vpc_id
  web-sg_name          = "WEB-SG"
  web-sg_nametag       = "WEB-SG"
  webserver-sg_name    = "WEBSERVER-SG"
  webserver-sg_nametag = "WEBSERVER-SG"
  database-sg_name     = "DATABASE-SG"
  database-sg_nametag  = "DATABASE-SG"
}

module "loadbalancer" {
  source            = "../modules/loadbalancer"
  elb_sg            = module.securitygroups.webserver-sg.id
  elb_subnet_1      = module.networking.subnet-id-1.id
  elb_subnet_2      = module.networking.subnet-id-2.id
  vpc_id            = module.networking.vpc_id
  elb_instance1     = module.webservers.webserver1.id
  elb_instance2     = module.webservers.webserver2.id
  external-elb_name = "External-LB"
  target-group_name = "ALB-TG"
}

module "database" {
  source                  = "../modules/database"
  db_name                 = "RDSDB"
  db-instance_username    = "admin"
  db-instance_password    = "Admin1234"
  db-subnet-group_name    = "main"
  db-subnet-group_nametag = "My DB subnet group"
  db-subnet-1             = module.networking.database-subnet-1.id
  db-subnet-2             = module.networking.database-subnet-2.id
  db_sg                   = module.securitygroups.webserver-sg.id
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.loadbalancer.lb_dns_name
}
