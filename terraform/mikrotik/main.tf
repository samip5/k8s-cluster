module "rb5009" {
  source              = "./modules/rb5009"
  mikrotik_host_url   = "https://192.168.2.1"
  mikrotik_username   = var.mikrotik_username
  mikrotik_password   = var.mikrotik_password
  mikrotik_insecure   = true
  doh_server_url      = "https://dns.nextdns.io/f5ec55"
}