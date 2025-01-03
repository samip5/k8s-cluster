# =================================================================================================
# DNS Server
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/ip_dns
# =================================================================================================
resource "routeros_ip_dns" "dns-server" {
  allow_remote_requests = true
  use_doh_server = var.doh_server_url
  verify_doh_cert = false # It needs the CA certs on the router

  servers = ["2a07:a8c0::f5:ec55", "2a07:a8c1::f5:ec55", "45.90.28.251", "45.90.30.251"]

  cache_size    = 2048
  cache_max_ttl = "1d"
}