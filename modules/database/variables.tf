variable "db-instance_name" {
  description = "database instance name"
  default     = "RDS-DB"
}
variable "db-instance_username" {
  description = "database instance username"
  default     = "admin"
}
variable "db-instance_password" {
  description = "database instance password"
  default     = "admin"
}
variable "db-subnet-group_name" {
  description = "database subnet group name"
  default     = "main"
}
variable "db-subnet-group_nametag" {
  description = "database subnet group nametag"
  default     = "My DB subnet group"
}
