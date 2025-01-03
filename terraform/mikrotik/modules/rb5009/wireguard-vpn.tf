resource "routeros_interface_wireguard" "home-vpn" {
  listen_port = 51820
  name        = "home-vpn"
}

resource "routeros_interface_wireguard" "backdoor" {
  listen_port = 51821
  name        = "backdoor"
}

resource "routeros_interface_wireguard_peer" "backdoor-peer1" {
  public_key = "pXvkJNj+zhx1LTXSZOd+ETTKe9GjIJCxY0HMJbtWVAI="
  interface  = routeros_interface_wireguard.backdoor.name
  allowed_address = [
    "10.0.0.0/24",
    "10.0.1.0/24",
    "172.17.50.0/24",
    "172.17.51.0/24",
    "2001:67c:1be8:2::/64"
  ]
  endpoint_address = "takaovi.kapsi.fi"
  endpoint_port = "51820"
  persistent_keepalive = "1520s"
  is_responder = true
}

resource "routeros_ip_firewall_addr_list" "backdoor-addr-v4-1" {
  address = "10.0.0.0/24"
  list = "backdoor-addr-v4"
}

resource "routeros_ip_firewall_addr_list" "backdoor-addr-v4-2" {
  address = "10.0.1.0/24"
  list = "backdoor-addr-v4"
}

resource "routeros_ip_firewall_addr_list" "backdoor-addr-v4-3" {
  address = "172.17.50.0/24"
  list = "backdoor-addr-v4"
}

resource "routeros_ip_firewall_addr_list" "backdoor-addr-v4-4" {
  address = "172.17.51.0/24"
  list = "backdoor-addr-v4"
}
resource "routeros_ipv6_firewall_addr_list" "backdoor-addr-v6-1" {
  address = "2001:67c:1be8:2::/64"
  list = "backdoor-addr-v6"
}


resource "routeros_ip_address" "backdoorV4" {
  address   = "10.13.38.4/32"
  interface = routeros_interface_wireguard.backdoor.name
}

resource "routeros_ipv6_address" "backdoorV6" {
  address   = "2001:67c:1be8:3b::4/12"
  interface = routeros_interface_wireguard.backdoor.name
}

resource "routeros_ip_firewall_nat" "backdoorNAT" {
  action = "masquerade"
  chain  = "srcnat"
  dst_address_list = "backdoor-addr-v4"
  out_interface = routeros_interface_wireguard.backdoor.name
}

# resource "routeros_ipv6_firewall_nat" "backdoorNATv6" {
#   action = "masquerade"
#   chain = "srcnat"
#   out_interface = routeros_interface_wireguard.backdoor.name
# }