resource "routeros_interface_vlan" "IoT" {
  interface = routeros_interface_bridge.bridge.name
  name      = "IoT"
  vlan_id   = 50
}

resource "routeros_ip_address" "IoTv4" {
  address   = "10.0.50.1/24"
  interface = routeros_interface_vlan.IoT.name
  network = "10.0.50.0"
}

resource "routeros_ipv6_address" "IoTv6" {
  address = "fd9d:7a72:44eb:e::1/64"
  advertise = true
  interface = routeros_interface_vlan.IoT.name
}

resource "routeros_interface_bridge_vlan" "IoT" {
  bridge   = routeros_interface_bridge.bridge.name
  vlan_ids = [routeros_interface_vlan.IoT.vlan_id]

  tagged = [
    routeros_interface_bridge.bridge.name,
    routeros_interface_ethernet.trunk.name
  ]
  untagged = []
}

resource "routeros_ip_pool" "IoT_dhcp" {
  name = "iot-dhcp-pool"
  ranges = ["10.0.50.30-10.0.50.100"]
}

resource "routeros_ip_dhcp_server_network" "IoT" {
  comment = "IoT DHCP Network"
  domain = "iot.home.skylab.fi"
  address = "10.0.50.0/24"
  gateway = "10.0.50.1"
  dns_server = ["10.0.50.1"]
}

resource "routeros_ip_dhcp_server" "IoT" {
  name = "IoT"
  address_pool = routeros_ip_pool.IoT_dhcp.name
  interface = routeros_interface_vlan.IoT.name
  conflict_detection = false
}

resource "routeros_ip_dhcp_server_lease" "IoT" {
  for_each =  {
    nebula-w7 =  { mac_address = "d8:3a:dd:d8:70:bc", address = "10.0.50.9"}
    nebula-w-amd-2 = { mac_address = "d8:cb:8a:1d:a0:d2", address = "10.0.50.10"}
    nebula-w-amd-3 = { mac_address = "ec:8e:b5:7b:ef:aa", address = "10.0.50.11"}
    nebula-w-amd-1 = { mac_address = "6c:4b:90:2d:a8:07", address = "10.0.50.12"}
    nebula-m1 = { mac_address = "6c:4b:90:2d:a7:dd", address = "10.0.50.13"}
    printer = { mac_address = "bc:f4:d4:7e:44:c4", address = "10.0.50.18"}
    misc-device = { mac_address = "50:8b:b9:57:c4:8a", address = "10.0.50.115"}
    ESP_5D8220 = { mac_address = "48:55:19:5d:82:20", address = "10.0.50.120"}
    ESP_5DF70D = { mac_address = "48:55:19:5d:f7:0d", address = "10.0.50.121"}
    ESP_5DDEC2 = { mac_address = "48:55:19:5d:de:c2", address = "10.0.50.122"}
    ESP_5E4B21 = { mac_address = "48:55:19:5e:4b:21", address = "10.0.50.123"}
  }

  server = routeros_ip_dhcp_server.IoT.name

  mac_address = each.value.mac_address
  address = each.value.address
  comment = each.key
}
