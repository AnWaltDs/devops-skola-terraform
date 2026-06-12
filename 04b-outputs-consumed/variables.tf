variable "vm_name" {
  type    = string
  default = "demo-vm"
}

variable "flavor_name" {
  type    = string
  default = "1C-1GB"
}

variable "image_name" {
  type    = string
  default = "Ubuntu 22.04 Jammy Jellyfish x86_64"
}

variable "network_name" {
  type    = string
  default = "demo-network"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
