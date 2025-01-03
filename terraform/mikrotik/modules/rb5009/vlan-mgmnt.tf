resource "routeros_interface_vlan" "MGMNT" {
  interface = routeros_interface_bridge.bridge.name
  name      = "MGMNT"
  vlan_id   = 99
}

resource "routeros_ip_address" "MGMNT" {
  address   = "192.168.99.1/24"
  interface = routeros_interface_vlan.MGMNT.name
  network = "192.168.99.0"
}

resource "routeros_interface_bridge_vlan" "MGMNT" {
  bridge   = routeros_interface_bridge.bridge.name
  vlan_ids = [routeros_interface_vlan.MGMNT.vlan_id]

  tagged = [
    routeros_interface_bridge.bridge.name,
    routeros_interface_ethernet.trunk.name
  ]
  untagged = [
    routeros_interface_ethernet.mngmt-backup.name
  ]
}

resource "routeros_ip_pool" "mgmnt_dhcp" {
  name = "management dhcp-pool"
  ranges = ["192.168.99.99-192.168.99.100"]
}

resource "routeros_ip_dhcp_server_network" "MGMNT" {
  comment = "Management DHCP Network"
  address = "192.168.99.0/24"
  gateway = "192.168.99.1"
  dns_server = ["192.168.99.1"]
}

resource "routeros_ip_dhcp_server" "MGMNT" {
  name = "Management"
  address_pool = routeros_ip_pool.mgmnt_dhcp.name
  interface = routeros_interface_vlan.MGMNT.name
  conflict_detection = false
}

resource "routeros_ip_dhcp_server_lease" "MGMNT" {
  for_each =  {
    unifi-access-point =  { mac_address = "f4:92:bf:a0:b8:c7", address = "192.168.99.15"}
  }

  server = routeros_ip_dhcp_server.MGMNT.name

  mac_address = each.value.mac_address
  address = each.value.address
  comment = each.key
}
