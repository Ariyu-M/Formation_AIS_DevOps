resource "sftpgo_group" "sftpgo-All" {
  name        = "sftpgo-All"
  description = "This is a group for the link with the AD"
    
    user_settings = {
    filesystem = {
      provider = "0"
    }
    filters = {
      max_shares_expiration = 7
      default_shares_expiration = 1
      web_client = [
        "password-change-disabled",
        "password-reset-disabled",
        "shares-without-password-disabled"
      ]
    }
  }
}