# Answer

Provider is there but has no credentials. Empty block + no OS_* env vars = tofu doesn't know where to connect.

```hcl
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.54.0"
    }
  }
}

provider "openstack" {} # <- no auth_url, no password, nothing

resource "openstack_compute_instance_v2" "demo" {
  name = "demo-vm"
}
```
