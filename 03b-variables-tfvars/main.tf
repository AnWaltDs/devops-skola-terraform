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
  auth_url         = var.auth_url
  tenant_name      = var.tenant_name
  user_name        = var.user_name
  password         = var.password
  region           = var.region
  user_domain_name = var.user_domain_name
}

# Deploy an instance on OpenStack.
resource "openstack_compute_instance_v2" "demo" {
  name       = var.vm_name
  flavor_id  = var.flavor_id
  image_name = var.image_name
}
