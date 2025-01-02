# =================================================================================================
# NTP Server
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_ntp_server
# =================================================================================================
resource "routeros_system_ntp_server" "server" {
  enabled             = true
  broadcast           = true
  multicast           = true
  manycast            = true
  use_local_clock     = true
  local_clock_stratum = 3
}

# =================================================================================================
# NTP Client
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_ntp_client
# =================================================================================================
resource "routeros_system_ntp_client" "client" {
  enabled = true
  mode    = "unicast"
  servers = ["fi.pool.ntp.org"]
}