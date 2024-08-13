terraform {
  required_providers {
    sftpgo = {
      source  = "registry.terraform.io/drakkan/sftpgo"
    }
  }
}

provider "sftpgo" {
  host     = "https://localhost:8080"
  username = var.sftpgo_admin_user
  password = "password"
}