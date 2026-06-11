# Answer

Resources consume attributes from other resources using `<type>.<name>.<attribute>`. Terraform/OpenTofu automatically builds a dependency graph from these references — it knows the network must exist before the subnet, and the subnet before the port.

```hcl
resource "openstack_networking_subnet_v2" "demo" {
  network_id = openstack_networking_network_v2.demo.id  # <- waits for the network to be created first
}

resource "openstack_networking_port_v2" "demo" {
  network_id = openstack_networking_network_v2.demo.id  # <- references the network
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.demo.id  # <- references the subnet
  }
}
```

This is the same mechanism as outputs — every resource attribute can be referenced by other resources. Outputs just make selected values visible outside the configuration.
