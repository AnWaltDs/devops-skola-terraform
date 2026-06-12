# --- Provider variables ---

variable "auth_url" {
  description = "OpenStack auth endpoint"
  type        = string
}

variable "tenant_name" {
  description = "OpenStack project / tenant name"
  type        = string
}

variable "user_name" {
  description = "OpenStack user name"
  type        = string
}

variable "password" {
  description = "OpenStack password"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "OpenStack region"
  type        = string
}

variable "user_domain_name" {
  description = "OpenStack user domain"
  type        = string
  default     = "Default"
}

# --- Resource variables ---

variable "vm_name" {
  description = "Instance name"
  type        = string
  default     = "demo-vm"
}

variable "flavor_name" {
  description = "Flavor or size identifier"
  type        = string
  default     = "1C-1GB"
}

variable "image_name" {
  description = "Operating system image"
  type        = string
  default     = "Ubuntu 22.04 Jammy Jellyfish x86_64"
}
