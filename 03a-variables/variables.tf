variable "vm_name" {
  description = "Instance name"
  type        = string
  default     = "demo-vm"
}

variable "flavor_id" {
  description = "Flavor or size identifier"
  type        = string
  default     = "tiny"
}

variable "image_name" {
  description = "Operating system image"
  type        = string
  default     = "ubuntu-22.04"
}
