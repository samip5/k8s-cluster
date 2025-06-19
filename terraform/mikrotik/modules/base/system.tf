# =================================================================================================
# System Identity
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_identity
# =================================================================================================
resource "routeros_system_identity" "identity" {
  name = var.hostname
}


# =================================================================================================
# System Timezone
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_clock
# =================================================================================================
resource "routeros_system_clock" "timezone" {
  time_zone_name       = var.timezone
  time_zone_autodetect = false
}