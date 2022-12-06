variable "web-sg_name" {
  description = "Allow HTTP inbound traffic"
  default     = "WEB-SG"
}
variable "web-sg_nametag" {
  description = "tagname for web-sg"
  default     = "WEB-SG"
}
variable "webserver-sg_name" {
  description = "Allow inbound traffic from ALB"
  default     = "WEBSERVER-SG"
}
variable "webserver-sg_nametag" {
  description = "tagname for webserver-sg"
  default     = "WEBSERVER-SG"
}
variable "database-sg_name" {
  description = "Allow inbound traffic from application layer"
  default     = "DATABASE-SG"
}
variable "database-sg_nametag" {
  description = "tagname for database-sg"
  default     = "DATABASE-SG"
}
