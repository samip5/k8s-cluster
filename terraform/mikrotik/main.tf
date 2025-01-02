module "rb5009" {
  source              = "./modules/rb5009"
  mikrotik_host_url   = "https://192.168.88.1"
  mikrotik_username   = var.mikrotik_username
  mikrotik_password   = var.mikrotik_password
  mikrotik_insecure   = true
}