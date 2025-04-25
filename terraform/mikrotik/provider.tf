# =================================================================================================
# Provider Configuration
# =================================================================================================
terraform {
  required_providers {
    routeros = {
      source  = "terraform-routeros/routeros"
      version = "1.83.0"
    }
  }
  #backend "pg" {
  #  conn_str = "postgres://psql1.n.kapsi.fi/kryptonian_terraform"
  #}
}
