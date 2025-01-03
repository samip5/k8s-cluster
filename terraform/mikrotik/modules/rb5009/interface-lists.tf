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

resource "routeros_interface_list" "VLANs" {
  name = "VLANs"
}

resource "routeros_interface_list_member" "IoTVLAN" {
  interface = routeros_interface_vlan.IoT.name
  list      = routeros_interface_list.VLANs.name
}

resource "routeros_interface_list_member" "LANVLAN" {
  interface = routeros_interface_vlan.LAN.name
  list      = routeros_interface_list.VLANs.name
}

resource "routeros_interface_list_member" "KubeProdVLAN" {
  interface = routeros_interface_vlan.KubeProd.name
  list      = routeros_interface_list.VLANs.name
}

resource "routeros_interface_list_member" "KubeDevVLAN" {
  interface = routeros_interface_vlan.KubeDev.name
  list      = routeros_interface_list.VLANs.name
}
