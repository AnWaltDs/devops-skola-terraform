# Expose useful values after deployment.
output "network_id" {
  description = "ID of the created network"
  value       = openstack_networking_network_v2.demo.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = openstack_networking_subnet_v2.demo.id
}

output "instance_id" {
  description = "ID of the created instance"
  value       = openstack_compute_instance_v2.demo.id
}
