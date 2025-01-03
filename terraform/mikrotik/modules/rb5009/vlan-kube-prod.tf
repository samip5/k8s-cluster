resource "routeros_interface_vlan" "KubeProd" {
  interface = routeros_interface_bridge.bridge.name
  name      = "KubeProd"
  vlan_id   = 105
}

resource "routeros_ip_address" "KubeProdv4" {
  address   = "10.0.105.1/24"
  interface = routeros_interface_vlan.KubeProd.name
  network = "10.0.105.0"
}

resource "routeros_ipv6_address" "KubeProdv6" {
  interface = routeros_interface_vlan.KubeProd.name
  address = "fd9d:7a72:44eb:c::1/64"
  advertise = true
}

resource "routeros_interface_bridge_vlan" "KubeProd" {
  bridge   = routeros_interface_bridge.bridge.name
  vlan_ids = [routeros_interface_vlan.KubeProd.vlan_id]

  tagged = [
    routeros_interface_bridge.bridge.name,
    routeros_interface_ethernet.trunk.name
  ]
  untagged = []
}

resource "routeros_ip_pool" "KubeProd_dhcp" {
  name = "kubernetes-prod-dhcp-pool"
  ranges = ["10.0.105.30-10.0.105.100"]
}

resource "routeros_ip_dhcp_server_network" "KubeProd" {
  comment = "Kubernetes Production DHCP Network"
  domain = "kubeprod.skylab.fi"
  address = "10.0.105.0/24"
  gateway = "10.0.105.1"
  dns_server = ["10.0.105.1"]
}

resource "routeros_ip_dhcp_server" "KubeProd" {
  name = "KubeProd"
  address_pool = routeros_ip_pool.KubeProd_dhcp.name
  interface = routeros_interface_vlan.KubeProd.name
  conflict_detection = false
}

resource "routeros_ip_dhcp_server_lease" "KubeProd" {
  for_each =  {
    nebula-w7 =  { mac_address = "d8:3a:dd:d8:70:bc", address = "10.0.105.29"}
    nebula-w-amd-2 = { mac_address = "00:d0:b4:02:01:95", address = "10.0.105.35"}
    nebula-w-amd-3 = { mac_address = "ec:8e:b5:7b:ef:aa", address = "10.0.105.19"}
    nebula-w-amd-1 = { mac_address = "6c:4b:90:2d:a8:07", address = "10.0.105.50"}
    nebula-m1 = { mac_address = "6c:4b:90:2d:a7:dd", address = "10.0.105.34"}
    nebula-cm4-1 = { mac_address = "e4:5f:01:2e:06:ac", address = "10.0.105.32"}
  }

  server = routeros_ip_dhcp_server.KubeProd.name

  mac_address = each.value.mac_address
  address = each.value.address
  comment = each.key
}
