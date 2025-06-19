# =================================================================================================
# Bridge Interfaces
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge
# =================================================================================================
resource "routeros_interface_bridge" "bridge" {
  name           = var.bridge_name
  comment        = var.bridge_comment
  vlan_filtering = true
  mtu            = 1514 # ?Set to 9500 for jumbo frames
}


# =================================================================================================
# Bridge Ports
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_port
# =================================================================================================
resource "routeros_interface_bridge_port" "ethernet_ports" {
  for_each = {
    for k, v in var.ethernet_interfaces : k => v
    if v.bridge_port != false
  }

  bridge    = routeros_interface_bridge.bridge.name
  interface = each.key
  comment   = each.value.comment != null ? each.value.comment : ""

  # If untagged VLAN is specified, find its VLAN ID as PVID
  pvid = (each.value.untagged != null && each.value.untagged != "") ? (
  [for k, v in var.vlans : v.vlan_id if v.name == each.value.untagged][0]
  ) : 1
}