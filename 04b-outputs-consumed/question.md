# Question

How do resources reference each other? Look at the `network_id` and `subnet_id` arguments — where do those values come from?

```hcl
resource "openstack_networking_subnet_v2" "demo" {
  network_id = openstack_networking_network_v2.demo.id
}

resource "openstack_networking_port_v2" "demo" {
  network_id = openstack_networking_network_v2.demo.id

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.demo.id
  }
}
```
