module "provider"{
source                      = "../modules/provider"
region                      = "us-east-1"
}

module "networking"{
source                      = "../modules/networking"
vpc_cidr_block              = "10.0.0.0/16"
vpc_name                    = "three-tier"
websubnet1_cidr_block       = "10.0.1.0/24"
websubnet1_az               = "us-east-1a"
websubnet1_nametag          = "websubnet1a"
websubnet2_cidr_block       = "10.0.2.0/24"
websubnet2_az               = "us-east-1b"
websubnet2_nametag          = "websubnet1b"
appsubnet1_cidr_block       = "10.0.11.0/24"
appsubnet1_az               = "us-east-1a"
appsubnet1_nametag          = "appsubnet1a"
appsubnet2_cidr_block       = "10.0.12.0/24"
appsubnet2_az               = "us-east-1b"
appsubnet2_nametag          = "appsubnet1b"
dbsubnet1_cidr_block        = "10.0.21.0/24"
dbsubnet1_az                = "us-east-1a"
dbsubnet1_nametag           = "dbsubnet1a"
dbsubnet2_cidr_block        = "10.0.22.0/24"
dbsubnet2_az                = "us-east-1b"
dbsubnet2_nametag           = "dbsubnet1b"
igw_nametag                 = "IGW-3TIER"
route_cidr_block            = "0.0.0.0/0"
webrt_nametag               = "WEB-ROUTE-TABLE"
}

module "webservers"{
source                      = "../modules/webservers"
webserver1_ami_id           = "ami-0d5eff06f840b45e9"
webserver1_instance_type    = "t2.micro"
webserver1_az               = "us-east-1a"
webserver1_nametag          = "WEBSERVER1"
webserver2_ami_id           = "ami-0d5eff06f840b45e9"
webserver2_instance_type    = "t2.micro"
webserver2_az               = "us-east-1b"
webserver2_nametag          = "WEBSERVER2"
}

module "securitygroups"{
source                      = "../modules/securitygroups"
web-sg_name                 = "WEB-SG"
web-sg_nametag              = "WEB-SG"
webserver-sg_name           = "WEBSERVER-SG"
webserver-sg_nametag        = "WEBSERVER-SG"
database-sg_name            = "DATABASE-SG"
database-sg_nametag         = "DATABASE-SG"
}

module "loadbalancer"{
source                     = "../modules/loadbalancer"
external-elb_name          = "External-LB"
target-group_name          = "ALB-TG"
}

module "database"{
source                     = "../modules/database"
db-instance_name           = "RDS-DB"
db-instance_username       = "admin"
db-instance_password       = "admin"
db-subnet-group_name       = "main"
db-subnet-group_nametag    = "My DB subnet group"
}

output "lb_dns_name" {
  description              = "The DNS name of the load balancer"
  value                    = aws_lb.external-elb.dns_name
}
