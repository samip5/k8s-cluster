variable "interface_name" {
  description = "Name of the VLAN interface the DHCP server is bound to"
  type        = string
}

variable "network" {
  description = "Network address in CIDR notation (e.g., 192.168.1.0/24)"
  type        = string
}

variable "gateway" {
  description = "Gateway IP address for the network"
  type        = string
}

variable "dhcp_pool" {
  description = "List of IP ranges for DHCP pool (e.g., [\"192.168.1.100-192.168.1.200\"])"
  type        = list(string)
}

variable "dns_servers" {
  description = "List of DNS servers to provide via DHCP"
  type        = list(string)
}

variable "domain" {
  description = "Domain name to provide via DHCP"
  type        = string
}

variable "static_leases" {
  description = "Map of static DHCP leases with MAC address and IP address"
  type = map(object({
    mac  = string
    name = string
  }))
  default = {}
}