resource "routeros_ip_dhcp_client" "WAN" {
  interface = routeros_interface_ethernet.wan.name
  add_default_route = "yes"
  default_route_distance = 25
  use_peer_dns = true
  use_peer_ntp = true
}

resource "routeros_ip_dhcp_client" "WAN2" {
  interface = routeros_interface_ethernet.wan2.name
  add_default_route = "yes"
  default_route_distance = 254
}