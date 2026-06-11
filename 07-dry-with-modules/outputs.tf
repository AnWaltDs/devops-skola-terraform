# Expose instance IDs per environment.
output "dev_instance_id" { value = module.dev.instance_id }
output "dev_network_id" { value = module.dev.network_id }

output "test_instance_id" { value = module.test.instance_id }
output "test_network_id" { value = module.test.network_id }

output "prod_instance_id" { value = module.prod.instance_id }
output "prod_network_id" { value = module.prod.network_id }
