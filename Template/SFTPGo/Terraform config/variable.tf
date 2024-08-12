variable "sftpgo_admin_user" {
  description = "Admin user for SFTPGo"
  type        = string
}

variable "body_shared" {
  description = "Content for the mail shared action"
  type        = string
}

variable "body_ip_banned" {
  description = "Content for the mail IP banned action"
  type        = string
}
