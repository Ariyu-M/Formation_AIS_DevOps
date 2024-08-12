terraform {
  required_providers {
    sftpgo = {
      source  = "registry.terraform.io/drakkan/sftpgo"
    }
  }
}

provider "sftpgo" {
  host     = "https://sftpgo.exemple.com"
  username = var.sftpgo_admin_user
  password = "PASSWORD"
}