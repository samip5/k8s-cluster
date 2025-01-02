resource "routeros_interface_bridge" "bridge" {
  name      =  "bridge"
  comment   = ""
  disabled = false
  vlan_filtering = true
}

resource "routeros_interface_bridge_port" "trunk" {
  bridge    = routeros_interface_bridge.bridge.name
  interface = routeros_interface_ethernet.
}