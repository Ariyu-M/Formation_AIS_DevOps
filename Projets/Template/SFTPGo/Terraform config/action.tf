# Receiving emails in case of IP banning

resource "sftpgo_action" "email_ip_banned" {
  name = "Mail IP Banned"
  type = 3 # Email
  options = {
    email_config = {
      recipients   = ["template@exemple.com"]
      subject      = "SFTPGO: IP Banned"
      body         = var.body_ip_banned
    }
  }
}


# Receiving emails notifying about the upload or deletion of a shared file

resource "sftpgo_action" "mail_shared" {
  name = "Mail Shared"
  type = 3 # Email
  options = {
    email_config = {
      recipients   = ["{{Name}}@exemple.com"]
      bcc          = ["template@exemple.com"]
      subject      = "SFTPGo FileShare"
      body         = var.body_shared
    }
  }
}