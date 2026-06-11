# Deploy an instance on OpenStack.
resource "openstack_compute_instance_v2" "demo" {
  name = "demo-vm"
}
