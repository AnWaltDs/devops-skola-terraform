# Expose resource IDs for use by other configurations.
output "network_id" { value = openstack_networking_network_v2.this.id }
output "subnet_id" { value = openstack_networking_subnet_v2.this.id }
output "security_group_id" { value = openstack_networking_secgroup_v2.this.id }
output "port_id" { value = openstack_networking_port_v2.this.id }
output "instance_id" { value = openstack_compute_instance_v2.this.id }
