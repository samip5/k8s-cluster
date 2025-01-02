terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}

# =================================================================================================
# Provider configuration
# =================================================================================================
provider "routeros" {
  hosturl  = var.mikrotik_host_url
  username = var.mikrotik_username
  password = var.mikrotik_password
  insecure = var.mikrotik_insecure
}