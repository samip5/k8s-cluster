resource "routeros_interface_list_member" "WAN" {
  interface = routeros_interface_ethernet.wan.name
  list = "WAN"
}

resource "routeros_interface_list_member" "WAN2" {
  interface = routeros_interface_ethernet.wan2.name
  list = "WAN"
}

resource "routeros_interface_list_member" "VLANLAN" {
  interface = routeros_interface_vlan.LAN.name
  list = "LAN"
}

resource "routeros_interface_list_member" "KubeProd" {
  interface = routeros_interface_vlan.KubeProd.name
  list = "LAN"
}

resource "routeros_interface_list_member" "KubeDev" {
  interface = routeros_interface_vlan.KubeDev.name
  list = "LAN"
}
