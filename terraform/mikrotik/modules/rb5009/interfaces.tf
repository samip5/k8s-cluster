resource "routeros_interface_ethernet" "wan" {
  factory_name = "ether1"
  name = "ether1"
  comment = "Cable Modem Uplink"
  poe_out = "off"
}

resource "routeros_interface_ethernet" "wan2" {
  factory_name = "ether2"
  name = "wan2"
  comment = "LTE backup"
  poe_out = "off"
}

resource "routeros_interface_ethernet" "ether3" {
  factory_name = "ether3"
  name = "ether3"
  poe_out = "off"
  disabled = true
}

resource "routeros_interface_ethernet" "ether4" {
  factory_name = "ether4"
  name         = "ether4"
  poe_out = "off"
}

resource "routeros_interface_ethernet" "ether5" {
  factory_name = "ether5"
  name         = "ether5"
  poe_out = "off"
}

resource "routeros_interface_ethernet" "ether6" {
  factory_name = "ether6"
  name         = "ether6"
  disabled     = true
  poe_out = "off"
}

resource "routeros_interface_ethernet" "ether7" {
  factory_name = "ether7"
  name         = "ether7"
  disabled     = true
  poe_out = "off"
}

resource "routeros_interface_ethernet" "mngmt-backup" {
  factory_name = "ether8"
  name = "ether8"
  comment = "Management BACKUP"
  poe_out = "off"
}

resource "routeros_interface_ethernet" "trunk" {
  factory_name = "sfp-sfpplus1"
  name         = "fiber-trunk"
}