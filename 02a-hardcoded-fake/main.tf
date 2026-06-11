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

# Configure the OpenStack provider with connection details.
provider "openstack" {
  auth_url    = "https://openstack.example.com:5000/v3"
  tenant_name = "training"
  user_name   = "student"
  password    = "change-me"
  region      = "RegionOne"
}

# Deploy an instance on OpenStack.
resource "openstack_compute_instance_v2" "demo" {
  name      = "demo-vm"
  flavor_id  = "tiny"
  image_name = "ubuntu-22.04"
}
