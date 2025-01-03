

# resource "routeros_routing_bgp_template" "default" {
#   as   = "213021"
#   name = "default"
#   address_families = "IPv4 IPv6"
# }
#
#
#
# resource "routeros_routing_bgp_connection" "nebula-w-amd-1" {
#   as   = "213021"
#   name = "nebula-w-amd-1"
#
#
#   templates = ["default"]
# }