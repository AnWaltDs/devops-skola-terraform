# Answer

Resource values are variables now -- reusable. But credentials are still hardcoded in the provider block.

```hcl
provider "openstack" {
  auth_url         = "https://kna1.citycloud.com:5000"       # <- still hardcoded
  tenant_name      = "iac-openshift-project-test"
  user_name        = "iac-user"
  password         = "nPBrZxNc5CC76lMdsa"                    # <- still hardcoded
  region           = "Kna1"
  user_domain_name = "CCP_Domain_50692"
}

resource "openstack_compute_instance_v2" "demo" {
  name       = var.vm_name     # <- variable now
  flavor_name = var.flavor_name  # <- variable now
  image_name = var.image_name  # <- variable now
}
```
