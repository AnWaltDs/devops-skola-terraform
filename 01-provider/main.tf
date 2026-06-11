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

# Deploy an instance on OpenStack.
resource "openstack_compute_instance_v2" "demo" {
  name = "demo-vm"
}
