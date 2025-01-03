terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}

resource "routeros_routing_bgp_template" "default" {
  as   = "213021"
  name = "better"
  keepalive_time = "30s"
  hold_time = "90s"
  address_families = "ip, ipv6"
}

resource "routeros_routing_bgp_connection" "plex-srv-v6" {
  as   = routeros_routing_bgp_template.default.as
  templates = [routeros_routing_bgp_template.default.name]
  name = "plex-srv-v6"
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"
  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:a::1"
  }
  remote {
    address = "fd9d:7a72:44eb:a:a236:9fff:fe18:55fb"
    as = routeros_routing_bgp_template.default.as
  }
}

# resource "routeros_routing_bgp_connection" "plex-srv-v4" {
#   as   = routeros_routing_bgp_template.default.as
#   name = "plex-srv-v4"
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "192.168.2.1"
#   }
#
#   remote {
#     address = "192.168.2.129"
#     as = routeros_routing_bgp_template.default.as
#   }
# }

