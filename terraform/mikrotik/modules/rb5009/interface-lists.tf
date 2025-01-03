resource "routeros_interface_list_member" "WAN" {
  interface = routeros_interface_ethernet.wan.name
  list = "WAN"
}

resource "routeros_interface_list_member" "WAN2" {
  interface = routeros_interface_ethernet.wan2.name
  list = "WAN"
}