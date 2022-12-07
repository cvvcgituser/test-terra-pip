variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "three-tier"
}
variable "websubnet1_cidr_block" {
  description = "CIDR block for websubnet1"
  default     = "10.0.1.0/24"
}
variable "websubnet1_az" {
  description = "availability zone for websubnet1"
  default     = "us-east-1a"
}
variable "websubnet1_nametag" {
  description = "tag name for websubnet1"
  default     = "websubnet1a"
}
variable "websubnet2_cidr_block" {
  description = "CIDR block for websubnet2"
  default     = "10.0.2.0/24"
}
variable "websubnet2_az" {
  description = "availability zone for websubnet2"
  default     = "us-east-1b"
}
variable "websubnet2_nametag" {
  description = "tag name for websubnet2"
  default     = "websubnet1b"
}
variable "appsubnet1_cidr_block" {
  description = "CIDR block for appsubnet1"
  default     = "10.0.11.0/24"
}
variable "appsubnet1_az" {
  description = "availability zone for appsubnet1"
  default     = "us-east-1a"
}
variable "appsubnet1_nametag" {
  description = "tag name for appsubnet1"
  default     = "appsubnet1a"
}
variable "appsubnet2_cidr_block" {
  description = "CIDR block for appsubnet2"
  default     = "10.0.12.0/24"
}
variable "appsubnet2_az" {
  description = "availability zone for appsubnet2"
  default     = "us-east-1b"
}
variable "appsubnet2_nametag" {
  description = "tag name for appsubnet2"
  default     = "appsubnet1b"
}
variable "dbsubnet1_cidr_block" {
  description = "CIDR block for dbsubnet1"
  default     = "10.0.21.0/24"
}
variable "dbsubnet1_az" {
  description = "availability zone for dbsubnet1"
  default     = "us-east-1a"
}
variable "dbsubnet1_nametag" {
  description = "tag name for appsubnet1"
  default     = "dbsubnet1a"
}
variable "dbsubnet2_cidr_block" {
  description = "CIDR block for dbsubnet2"
  default     = "10.0.22.0/24"
}
variable "dbsubnet2_az" {
  description = "availability zone for dbsubnet2"
  default     = "us-east-1b"
}
variable "dbsubnet2_nametag" {
  description = "tag name for appsubnet2"
  default     = "dbsubnet1b"
}
variable "igw_nametag" {
  description = "tag name for internetgateway"
  default     = "IGW-3TIER"
}
variable "route_cidr_block" {
  description = "CIDR block for routetable"
  default     = "0.0.0.0/0"
}
variable "webrt_nametag" {
  description = "tag name for weblayer route table"
  default     = "WEB-ROUTE-TABLE"
}

