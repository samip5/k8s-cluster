# =================================================================================================
# Provider Configuration
# =================================================================================================
terraform {
  required_providers {
    routeros = {
      source  = "terraform-routeros/routeros"
      version = "1.76.7"
    }
  }
  #backend "pg" {
  #  conn_str = "postgres://psql1.n.kapsi.fi/kryptonian_terraform"
  #}
}
