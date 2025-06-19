resource "routeros_interface_ethernet" "ethernet" {
  for_each = var.ethernet_interfaces

  factory_name = each.key
  name         = each.key
  comment      = each.value.comment
  l2mtu        = 1514 # ?Set to 9500 for jumbo frames
}