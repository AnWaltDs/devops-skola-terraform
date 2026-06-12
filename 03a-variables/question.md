# Question

What improved? What is still wrong?

```hcl
provider "openstack" {
  auth_url         = "https://kna1.citycloud.com:5000"
  password         = "nPBrZxNc5CC76lMdsa"
}

resource "openstack_compute_instance_v2" "demo" {
  name       = var.vm_name
  flavor_name = var.flavor_name
  image_name = var.image_name
}
```
