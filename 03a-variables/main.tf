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
  auth_url         = "https://kna1.citycloud.com:5000"
  tenant_name      = "iac-openshift-project-test"
  user_name        = "iac-user"
  password         = "nPBrZxNc5CC76lMdsa"
  region           = "Kna1"
  user_domain_name = "CCP_Domain_50692"
}

# Deploy an instance on OpenStack.
resource "openstack_compute_instance_v2" "demo" {
  name       = var.vm_name
  flavor_id  = var.flavor_id
  image_name = var.image_name
}
