# resource "routeros_routing_bgp_connection" "nebula-m1-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   name = "nebula-m1"
#   as = routeros_routing_bgp_template.default.as
#   address_families = "ip"
#
#   local {
#     role = "ibgp"
#     address = "10.0.105.1"
#   }
#
#   remote {
#     address = "10.0.105.34"
#     as = routeros_routing_bgp_template.default.as
#   }
# }


resource "routeros_routing_bgp_connection" "nebula-m1-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  name = "nebula-m1-v6"
  as = routeros_routing_bgp_template.default.as
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"
  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:c::1"
  }
  remote {
    address = "fd9d:7a72:44eb:c:6e4b:90ff:fe2d:a7dd"
    as = routeros_routing_bgp_template.default.as
  }
}

# resource "routeros_routing_bgp_connection" "nebula-w-amd-1-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   name = "nebula-w-amd-1-v4"
#   as = routeros_routing_bgp_template.default.as
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "10.0.105.1"
#   }
#   remote {
#     address = "10.0.105.50"
#     as = routeros_routing_bgp_template.default.as
#   }
# }


resource "routeros_routing_bgp_connection" "nebula-w-amd-1-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  name = "nebula-w-amd-1-v6"
  as = routeros_routing_bgp_template.default.as
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"
  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:c::1"
  }
  remote {
    address = "fd9d:7a72:44eb:c:6e4b:90ff:fe2d:a807"
    as = routeros_routing_bgp_template.default.as
  }
}

# resource "routeros_routing_bgp_connection" "nebula-w-amd-2-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   name = "nebula-w-amd-2-v4"
#   as = routeros_routing_bgp_template.default.as
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "10.0.105.1"
#   }
#   remote {
#     address = "10.0.105.50"
#     as = routeros_routing_bgp_template.default.as
#   }
# }


resource "routeros_routing_bgp_connection" "nebula-w-amd-2-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  name = "nebula-w-amd-2-v6"
  as = routeros_routing_bgp_template.default.as
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"
  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:c::1"
  }
  remote {
    address = "fd9d:7a72:44eb:c:2d0:b4ff:fe02:195"
    as = routeros_routing_bgp_template.default.as
  }
}

# resource "routeros_routing_bgp_connection" "nebula-w-amd-3-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   name = "nebula-w-amd-3-v4"
#   as = routeros_routing_bgp_template.default.as
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "10.0.105.1"
#   }
#   remote {
#     address = "10.0.105.33"
#     as = routeros_routing_bgp_template.default.as
#   }
# }


resource "routeros_routing_bgp_connection" "nebula-w-amd-3-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  name = "nebula-w-amd-3-v6"
  as = routeros_routing_bgp_template.default.as
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"
  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:c::1"
  }
  remote {
    address = "fd9d:7a72:44eb:c:ee8e:b5ff:fe7b:efaa"
    as = routeros_routing_bgp_template.default.as
  }
}

# resource "routeros_routing_bgp_connection" "nebula-w-amd-4-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   name = "nebula-w-amd-4-v4"
#   as = routeros_routing_bgp_template.default.as
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "10.0.105.1"
#   }
#   remote {
#     address = "10.0.105.28"
#     as = routeros_routing_bgp_template.default.as
#   }
# }


resource "routeros_routing_bgp_connection" "nebula-w-amd-4-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  name = "nebula-w-amd-4-v6"
  as = routeros_routing_bgp_template.default.as
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"
  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:c::1"
  }
  remote {
    address = "fd9d:7a72:44eb:c:dacb:8aff:fe1d:a0d2"
    as = routeros_routing_bgp_template.default.as
  }
}


# resource "routeros_routing_bgp_connection" "nebula-cm4-1-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   name = "nebula-cm4-1-v4"
#   as = routeros_routing_bgp_template.default.as
#   address_families = "ip"
#   local {
#     role = "ibgp"
#     address = "10.0.105.1"
#   }
#   remote {
#     address = "10.0.105.32"
#     as = routeros_routing_bgp_template.default.as
#   }
# }



resource "routeros_routing_bgp_connection" "nebula-cm4-1-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  name = "nebula-cm4-1-v6"
  as = routeros_routing_bgp_template.default.as
  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"

  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:c::1"
  }
  remote {
    address = "fd9d:7a72:44eb:c:e65f:1ff:fe2e:6ac"
    as = routeros_routing_bgp_template.default.as
  }
}

# resource "routeros_routing_bgp_connection" "nebula-w7-v4" {
#   templates = [routeros_routing_bgp_template.default.name]
#   name = "nebula-w7-v4"
#   as = routeros_routing_bgp_template.default.as
#
#   address_families = "ip"
#
#   local {
#     role = "ibgp"
#     address = "10.0.105.1"
#   }
#   remote {
#     address = "10.0.105.29"
#     as = routeros_routing_bgp_template.default.as
#   }
# }



resource "routeros_routing_bgp_connection" "nebula-w7-v6" {
  templates = [routeros_routing_bgp_template.default.name]
  name = "nebula-w7-v6"
  as = routeros_routing_bgp_template.default.as

  address_families = "ip, ipv6"
  keepalive_time = "30s"
  hold_time = "90s"

  local {
    role = "ibgp"
    address = "fd9d:7a72:44eb:c::1"
  }
  remote {
    address = "fd9d:7a72:44eb:c:da3a:ddff:fed8:70bc"
    as = routeros_routing_bgp_template.default.as
  }
}



