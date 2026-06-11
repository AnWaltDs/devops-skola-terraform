# Pin the OpenStack provider to a known source and minimum version.
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.54.0"
    }
  }
}

# Configure the OpenStack provider.
provider "openstack" {}

# Create a private network.
resource "openstack_networking_network_v2" "demo" {
  name           = var.network_name
  admin_state_up = true
}

# Create a subnet inside the network.
resource "openstack_networking_subnet_v2" "demo" {
  name       = "${var.network_name}-subnet"
  network_id = openstack_networking_network_v2.demo.id
  cidr       = var.subnet_cidr
  ip_version = 4
}

# Create a port on the network.
resource "openstack_networking_port_v2" "demo" {
  name           = "${var.vm_name}-port"
  network_id     = openstack_networking_network_v2.demo.id
  admin_state_up = true

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.demo.id
  }
}

# Deploy an instance on OpenStack.
resource "openstack_compute_instance_v2" "demo" {
  name       = var.vm_name
  flavor_id  = var.flavor_id
  image_name = var.image_name

  network {
    port = openstack_networking_port_v2.demo.id
  }
}
