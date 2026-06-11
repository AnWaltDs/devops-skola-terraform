# Expose useful values after deployment.
output "instance_name" {
  description = "Name of the created instance"
  value       = openstack_compute_instance_v2.demo.name
}

output "instance_id" {
  description = "ID of the created instance"
  value       = openstack_compute_instance_v2.demo.id
}
