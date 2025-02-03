sftpgo_admin_user       = "admin"
body_shared             = <<EOF
Hello {{Name}},

A shared file has just been {{Event}}:
File: {{VirtualPath}}.
File size: {{FileSize}}o.
Client IP address: {{IP}}.


SFTPGO
EOF
body_ip_banned          = <<EOF
Hello,

An IP has just been banned: {{IP}}.

Have a good day.
EOF
