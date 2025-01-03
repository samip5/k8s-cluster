resource "routeros_interface_vlan" "KubeDev" {
  interface = routeros_interface_bridge.bridge.name
  name      = "KubeDev"
  vlan_id   = 110
}

resource "routeros_ip_address" "KubeDevv4" {
  address   = "10.0.110.1/24"
  interface = routeros_interface_vlan.KubeDev.name
  network = "10.0.110.0"
}

resource "routeros_ipv6_address" "KubeDevv6" {
  interface = routeros_interface_vlan.KubeDev.name
  address = "fd9d:7a72:44eb:d::1/64"
  advertise = true
}

resource "routeros_interface_bridge_vlan" "KubeDev" {
  bridge   = routeros_interface_bridge.bridge.name
  vlan_ids = [routeros_interface_vlan.KubeDev.vlan_id]

  tagged = [
    routeros_interface_bridge.bridge.name,
    routeros_interface_ethernet.trunk.name
  ]
  untagged = []
}

resource "routeros_ip_pool" "KubeDev_dhcp" {
  name = "kubernetes-dev-dhcp-pool"
  ranges = ["10.0.110.20-10.0.105.30"]
}

resource "routeros_ip_dhcp_server_network" "KubeDev" {
  comment = "Kubernetes Development DHCP Network"
  domain = "kubedev.skylab.fi"
  address = "10.0.110.0/24"
  gateway = "10.0.110.1"
  dns_server = ["10.0.110.1"]
}

resource "routeros_ip_dhcp_server" "KubeDev" {
  name = "KubeDev"
  address_pool = routeros_ip_pool.KubeDev_dhcp.name
  interface = routeros_interface_vlan.KubeDev.name
  conflict_detection = false
}

resource "routeros_ip_dhcp_server_lease" "KubeDev" {
  for_each =  {
    dev-m1 =  { mac_address = "e4:5f:01:1b:32:98", address = "10.0.110.18"}
    dev-w1 = { mac_address = "dc:a6:32:3f:93:01", address = "10.0.110.19"}
    dev-w2 = { mac_address = "e4:5f:01:1b:32:93", address = "10.0.110.20"}
  }

  server = routeros_ip_dhcp_server.KubeDev.name

  mac_address = each.value.mac_address
  address = each.value.address
  comment = each.key
}
