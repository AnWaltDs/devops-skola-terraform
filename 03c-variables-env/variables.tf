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
