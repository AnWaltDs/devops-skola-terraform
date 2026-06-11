# Question

What are the hardcoded values in this file? What happens if the URL or region changes?

```hcl
provider "openstack" {
  auth_url    = "https://openstack.example.com:5000/v3"
  tenant_name = "training"
  user_name   = "student"
  password    = "change-me"
  region      = "RegionOne"
}

resource "openstack_compute_instance_v2" "demo" {
  name      = "demo-vm"
  flavor_id  = "tiny"
  image_name = "ubuntu-22.04"
}
```
