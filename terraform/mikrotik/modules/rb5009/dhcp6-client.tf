resource "routeros_ipv6_dhcp_client" "WANv6" {
  interface = routeros_interface_ethernet.wan.name
  pool_name = "delegated-wan"
  add_default_route = false # We get it from SLAAC
  use_interface_duid = true
  pool_prefix_length = 60
  rapid_commit = false
  use_peer_dns = false
  request = ["prefix", "address"]
}