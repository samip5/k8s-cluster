## ================================================================================================
## Container System Configuration
## ================================================================================================
resource "routeros_container_config" "config" {
  registry_url = "https://registry.skysolutions/library/docker.io"
  ram_high     = "0"
  tmpdir       = "/usb1-part1/containers/tmp"
  layer_dir    = "/usb1-part1/containers/layers"
}


## ================================================================================================
## Bridge Network Configuration
## ================================================================================================
resource "routeros_ip_address" "containers" {
  address   = "172.19.0.1/24"
  interface = routeros_interface_bridge.bridge.name
  network   = "172.19.0.0"
}

resource "routeros_ip_firewall_nat" "containers" {
  comment       = "NAT Containers Traffic"
  chain         = "srcnat"
  out_interface = routeros_interface_bridge.bridge.name
  action        = "masquerade"
  src_address   = "${routeros_ip_address.containers.network}/24"
}

## ================================================================================================
## Cloudflare DDNS
## ================================================================================================
resource "routeros_interface_veth" "cloudflare-ddns" {
  name    = "veth-cloudflare-ddns"
  address = "172.19.0.2/24"
  gateway = "172.19.0.1"
  comment = "cloudflare-ddns Virtual interface"
}
resource "routeros_interface_bridge_port" "cloudflare-ddns" {
  bridge    = routeros_interface_bridge.bridge.name
  interface = routeros_interface_veth.cloudflare-ddns.name
  comment   = routeros_interface_veth.cloudflare-ddns.comment
  pvid      = "1"
}

resource "routeros_container_envs" "cloudflare-ddns-token" {
  name  = "cloudflare-ddns-envs"
  key   = "CF_API_TOKEN"
  value = var.cloudflare_token
}
resource "routeros_container_envs" "cloudflare-ddns-domains" {
  name  = "cloudflare-ddns-envs"
  key   = "DOMAINS"
  value = "vpn.${local.external_domain}"
}
resource "routeros_container_envs" "cloudflare-ddns-timezone" {
  name  = "cloudflare-ddns-envs"
  key   = "TZ"
  value = routeros_system_clock.timezone.time_zone_name
}
resource "routeros_container" "cloudflare-ddns" {
  comment      = "Cloudflare DDNS"
  remote_image = "favonia/cloudflare-ddns:1.13.2"

  interface     = routeros_interface_veth.cloudflare-ddns.name
  logging       = true
  start_on_boot = true

  envlist = "cloudflare-ddns-envs"
}
