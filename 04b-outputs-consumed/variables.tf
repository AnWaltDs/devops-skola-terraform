variable "vm_name" {
  type    = string
  default = "demo-vm"
}

variable "flavor_id" {
  type    = string
  default = "tiny"
}

variable "image_name" {
  type    = string
  default = "ubuntu-22.04"
}

variable "network_name" {
  type    = string
  default = "demo-network"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
