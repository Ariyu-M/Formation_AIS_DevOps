resource "sftpgo_rule" "event_ip_banned" {
    name    = "Event IP Banned"
    status  = 1
    trigger = 4
    actions = [
      {
      name  = "Mail IP Banned"
      } 
    ]
    depends_on = [sftpgo_action.email_ip_banned]
}

resource "sftpgo_rule" "event_shared" {
    name    = "Event Shared"
    status  = 1
    trigger = 1
    conditions = {
      fs_events = [
        "upload", 
        "download"
      ]
      protocols = ["HTTPShare"]
    }
    actions = [  
      {
      name  = "Mail Shared"
      } 
    ]
    depends_on = [sftpgo_action.mail_shared]
}
