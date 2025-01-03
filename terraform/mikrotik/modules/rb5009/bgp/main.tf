terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}

resource "routeros_routing_bgp_template" "default" {
  as   = "213021"
  name = "default"
}

resource "routeros_routing_bgp_connection" "plex-srv-v6" {
  as   = routeros_routing_bgp_template.default.as
  name = "plex-srv-v6"
  remote {
    address = "fd9d:7a72:44eb:a:a236:9fff:fe18:55fb"
    as = routeros_routing_bgp_template.default.as
  }
}

resource "routeros_routing_bgp_connection" "plex-srv-v4" {
  as   = routeros_routing_bgp_template.default.as
  name = "plex-srv-v4"
  remote {
    address = "192.168.2.129"
    as = routeros_routing_bgp_template.default.as
  }
}

