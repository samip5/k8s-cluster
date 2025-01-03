# resource "routeros_ipv6_dhcp_client" "WANv6" {
#   interface = routeros_interface_ethernet.wan.name
#   pool_name = "delegated-wan"
#   add_default_route = true
#   use_interface_duid = true
#   pool_prefix_length = 60
#   request = ["prefix", "address"]
# }