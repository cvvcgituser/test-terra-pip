variable "webserver1_ami_id" {
  description = "select image id for webserver1  "
  default     = "ami-0d5eff06f840b45e9"
}
variable "webserver1_instance_type" {
  description = "select instance type for webserver1  "
  default     = "t2.micro"
}
variable "webserver1_az" {
  description = "select availabilityzone for webserver1  "
  default     = "us-east-1a"
}
variable "webserver1_nametag" {
  description = "select nametag for webserver1  "
  default     = "WEBSERVER1"
}
variable "webserver2_ami_id" {
  description = "select image id for webserver2  "
  default     = "ami-0d5eff06f840b45e9"
}
variable "webserver2_instance_type" {
  description = "select instance type for webserver2  "
  default     = "t2.micro"
}
variable "webserver2_az" {
  description = "select availabilityzone for webserver2  "
  default     = "us-east-1b"
}
variable "webserver2_nametag" {
  description = "select nametag for webserver2  "
  default     = "WEBSERVER2"
}
