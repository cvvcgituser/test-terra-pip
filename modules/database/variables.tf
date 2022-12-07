variable "db_name" {
  description = "database instance name"
  default     = "RDSDB"
}
variable "db-instance_username" {
  description = "database instance username"
  default     = "admin"
}
variable "db-instance_password" {
  description = "database instance password"
  default     = "Admin1234"
}
variable "db-subnet-group_name" {
  description = "database subnet group name"
  default     = "main"
}
variable "db-subnet-group_nametag" {
  description = "database subnet group nametag"
  default     = "My DB subnet group"
}
variable "db-subnet-1" {}
variable "db-subnet-2" {}
variable "db_sg" {}
