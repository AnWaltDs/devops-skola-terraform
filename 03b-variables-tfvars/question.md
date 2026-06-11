# Question

No password in main.tf anymore. Is this safe to commit?

```hcl
provider "openstack" {
  password = var.password
}
```

Hint: look at `terraform.tfvars`.
