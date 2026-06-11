# Answer

Outputs print values after `tofu apply` and make them available to other configurations. Without outputs you would have to look up IDs manually in the cloud console.

```hcl
output "instance_id" {
  value = openstack_compute_instance_v2.demo.id # <- available via tofu output
}
```
