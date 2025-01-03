resource "routeros_interface_bridge" "bridge" {
  name      =  "bridge"
  comment   = ""
  disabled = false
  vlan_filtering = true
}

resource "routeros_interface_bridge_port" "trunk" {
  bridge    = routeros_interface_bridge.bridge.name
  interface = routeros_interface_ethernet.trunk.name
  pvid = routeros_interface_vlan.MGMNT.vlan_id
}

resource "routeros_interface_bridge_port" "mgmt-backup" {
  bridge = routeros_interface_bridge.bridge.name
  interface = routeros_interface_ethernet.mngmt-backup.name
  pvid = routeros_interface_vlan.MGMNT.vlan_id
}

resource "routeros_interface_bridge_port" "lan1" {
  bridge = routeros_interface_bridge.bridge.name
  interface = routeros_interface_ethernet.ether4.name
  pvid = routeros_interface_vlan.LAN.vlan_id
}