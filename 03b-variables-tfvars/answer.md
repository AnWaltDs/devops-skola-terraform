# Answer

main.tf is safe. But terraform.tfvars still has the password. Forget to .gitignore it and you're back to square one.

```hcl
provider "openstack" {
  auth_url         = var.auth_url
  tenant_name      = var.tenant_name
  user_name        = var.user_name
  password         = var.password         # <- value comes from terraform.tfvars
  region           = var.region
  user_domain_name = var.user_domain_name
}
```
