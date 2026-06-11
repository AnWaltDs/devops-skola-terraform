# Answer

Every value is hardcoded -- provider and resource. To change anything you have to edit the code itself. Reuse for a second environment means copying and editing the whole file.

```hcl
provider "openstack" {
  auth_url    = "https://openstack.example.com:5000/v3" # <- hardcoded
  tenant_name = "training"                               # <- hardcoded
  user_name   = "student"                                # <- hardcoded
  password    = "change-me"                              # <- hardcoded + visible
  region      = "RegionOne"                              # <- hardcoded
}

resource "openstack_compute_instance_v2" "demo" {
  name      = "demo-vm"       # <- hardcoded
  flavor_id  = "tiny"          # <- hardcoded
  image_name = "ubuntu-22.04"  # <- hardcoded
}
```
