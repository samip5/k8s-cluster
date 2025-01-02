## ================================================================================================
## Mikrotik Variables
## ================================================================================================
variable "mikrotik_username" {
  type        = string
  default     = "admin"
  description = "The username to authenticate against the RouterOS API."
}
variable "mikrotik_password" {
  type        = string
  description = "The password to authenticate against the RouterOS API."
  sensitive   = true
}