# =================================================================================================
# Bond Interfaces
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bonding
# =================================================================================================
resource "routeros_interface_bonding" "bonds" {
  for_each = var.bond_interfaces

  name                 = each.key
  slaves               = each.value.slaves
  comment              = each.value.comment
  mode                 = each.value.mode
  transmit_hash_policy = each.value.transmit_hash_policy
  mtu                  = 1500 # ?Set to 9000 for jumbo frames

}

# =================================================================================================
# Bond Bridge Ports
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_port
# =================================================================================================
resource "routeros_interface_bridge_port" "bond_ports" {
  for_each = {
    for k, v in var.bond_interfaces : k => v
  }

  bridge    = routeros_interface_bridge.bridge.name
  interface = each.key
  comment   = each.value.comment != null ? each.value.comment : ""

  # If untagged VLAN is specified, find its VLAN ID as PVID
  pvid = (each.value.untagged != null && each.value.untagged != "") ? (
  [for k, v in var.vlans : v.vlan_id if v.name == each.value.untagged][0]
  ) : 1
}