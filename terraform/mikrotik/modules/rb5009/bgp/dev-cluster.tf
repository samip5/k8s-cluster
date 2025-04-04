# resource "routeros_routing_bgp_connection" "dev-m1-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   as   = routeros_routing_bgp_template.default.as
#   name = "dev-m1-v4"
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "10.0.110.1"
#   }
#   remote {
#     address = "10.0.110.18"
#     as = routeros_routing_bgp_template.default.as
#   }
# }

resource "routeros_routing_bgp_connection" "dev-m1-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  as   = routeros_routing_bgp_template.default.as
  name = "dev-m1-v6"
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"
  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:d::1"
  }
  remote {
    address = "fd9d:7a72:44eb:d:da3a:ddff:fe9f:7977"
    as = routeros_routing_bgp_template.default.as
  }
}



# resource "routeros_routing_bgp_connection" "dev-w2-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   as   = routeros_routing_bgp_template.default.as
#   name = "dev-w2-v4"
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "10.0.110.1"
#   }
#   remote {
#     address = "10.0.110.20"
#     as = routeros_routing_bgp_template.default.as
#   }
# }

# resource "routeros_routing_bgp_connection" "dev-w2-v6" {
#   templates = [routeros_routing_bgp_template.default.name]
#   as   = routeros_routing_bgp_template.default.as
#   name = "dev-w2-v6"
#   address_families = "ip, ipv6"
#   keepalive_time = "30s"
#   hold_time = "90s"
#   local {
#     role = "ibgp"
#     address = "fd9d:7a72:44eb:d::1"
#   }
#   remote {
#     address = "fd9d:7a72:44eb:d:e65f:1ff:fe1b:3293"
#     as = routeros_routing_bgp_template.default.as
#   }
# }