variable "external-elb_name" {
  description = "load balancer name"
  default     = "External-LB"
}
variable "target-group_name" {
  description = "target group name"
  default     = "ALB-TG"
}
variable "elb_sg" {}
variable "elb_subnet_1" {}
variable "elb_subnet_2" {}
variable "vpc_id" {}
variable "elb_instance1" {}
variable "elb_instance2" {}
