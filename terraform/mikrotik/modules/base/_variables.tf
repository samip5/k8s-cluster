# =================================================================================================
# Device settings
# =================================================================================================
variable "hostname" {
  type        = string
  description = "The name to assign to this device."
}

variable "timezone" {
  type        = string
  default     = "Europe/Helsinki"
  description = "The timezone to set on the device."
}

variable "ntp_servers" {
  type        = list(string)
  default     = ["fi.pool.ntp.org"]
  description = "List of NTP servers to use."
}

# =================================================================================================
# Management access
# =================================================================================================
variable "mac_server_interfaces" {
  type        = string
  default     = "all"
  description = "Interface list to allow MAC server access on."
}

# =================================================================================================
# Certificate details
# =================================================================================================
variable "certificate_common_name" {
  type        = string
  description = "CN for the device certificate."
}

variable "certificate_country" {
  type        = string
  default     = "RO"
  description = "Country code for the device certificate."
}

variable "certificate_locality" {
  type        = string
  default     = "BUC"
  description = "Locality for the device certificate."
}

variable "certificate_organization" {
  type        = string
  default     = "MIRCEANTON"
  description = "Organization for the device certificate."
}

variable "certificate_unit" {
  type        = string
  default     = "HOME"
  description = "Organizational unit for the device certificate."
}


# =================================================================================================
# Bridge settings
# =================================================================================================
variable "bridge_name" {
  type        = string
  default     = "bridge"
  description = "Name of the main bridge interface"
}

variable "bridge_comment" {
  type        = string
  default     = ""
  description = "Comment for the bridge interface"
}


# =================================================================================================
# VLAN Configuration
# =================================================================================================
variable "vlans" {
  type = map(object({
    name        = string
    vlan_id     = number
    network     = string
    cidr_suffix = string
    gateway     = string
    dhcp_pool   = list(string)
    dns_servers = list(string)
    domain      = string
    static_leases = map(object({
      name = string
      mac  = string
    }))
  }))
  default     = {}
  description = "Map of VLANs to configure"
}


# =================================================================================================
# Interface Configuration
# =================================================================================================
variable "ethernet_interfaces" {
  type = map(object({
    comment     = optional(string, "")
    bridge_port = optional(bool, true)

    # VLAN configurations
    tagged   = optional(list(string)) # list of VLAN names
    untagged = optional(string)       # VLAN name for untagged traffic
  }))
  default     = {}
  description = "Map of ethernet interfaces to configure"
}

variable "bond_interfaces" {
  type = map(object({
    comment              = optional(string, "")
    slaves               = list(string)
    mode                 = optional(string, "802.3ad")       # 802.3ad, balance-rr, balance-xor, broadcast, active-backup, balance-tlb, balance-alb
    transmit_hash_policy = optional(string, "layer-2-and-3") # layer-2, layer-2-and-3, layer-3-and-4

    # VLAN configurations
    tagged   = optional(list(string))
    untagged = optional(string)
  }))
  default     = {}
  description = "Map of bond interfaces to configure"
}