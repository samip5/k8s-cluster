variable "mikrotik_host_url" {
  type        = string
  sensitive   = false
  description = "The URL of the device"
}

variable "mikrotik_username" {
  type        = string
  sensitive   = true
  description = "The username for accessing the device"
}

variable "mikrotik_password" {
  type        = string
  sensitive   = true
  description = "The password for accessing the device"
}

variable "mikrotik_insecure" {
  type        = bool
  default     = true
  description = "Whether to allow insecure connections to the device"
}

variable "timezone" {
  type        = string
  default     = "Europe/Helsinki"
}

variable "doh_server_url" {
  type        = string
}