resource "routeros_interface_vlan" "LAN" {
  interface = routeros_interface_bridge.bridge.name
  name      = "LAN"
  vlan_id   = 10
}

resource "routeros_ip_address" "LAN" {
  address   = "192.168.2.1/24"
  interface = routeros_interface_vlan.LAN.name
  network = "192.168.2.0"
}

resource "routeros_ipv6_address" "LANv6ULA" {
  interface = routeros_interface_vlan.LAN.name
  address = "fd9d:7a72:44eb:a::1/64"
  advertise = true
}

resource "routeros_interface_bridge_vlan" "LAN" {
  bridge   = routeros_interface_bridge.bridge.name
  vlan_ids = [routeros_interface_vlan.LAN.vlan_id]

  tagged = [
    routeros_interface_bridge.bridge.name,
    routeros_interface_ethernet.trunk.name
  ]
  untagged = []
}

resource "routeros_ip_pool" "lan_dhcp" {
  name = "lan-dhcp-pool"
  ranges = ["192.168.2.10-192.168.2.245"]
}

resource "routeros_ip_dhcp_server_network" "LAN" {
  comment = "LAN DHCP Network"
  address = "192.168.2.0/24"
  gateway = "192.168.2.1"
  dns_server = ["192.168.2.1"]
}

resource "routeros_ip_dhcp_server" "LAN" {
  name = "LAN"
  address_pool = routeros_ip_pool.mgmnt_dhcp.name
  interface = routeros_interface_vlan.LAN.name
  conflict_detection = false
}

resource "routeros_ip_dhcp_server_lease" "LAN" {
  for_each =  {
    synology-nas =  { mac_address = "00:11:32:c6:fe:d5", address = "192.168.2.2"}
    access-point = { mac_address = "f4:92:bf:a0:b8:c7", address = "192.168.2.3"}
    plex-srv = { mac_address = "a0:36:9f:18:55:fb", address = "192.168.2.129"}
  }

  server = routeros_ip_dhcp_server.LAN.name

  mac_address = each.value.mac_address
  address = each.value.address
  comment = each.key
}
