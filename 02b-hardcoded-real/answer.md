# Answer

No. The password is in plain text. Git history keeps it forever, even if you delete the line later.

```hcl
provider "openstack" {
  password = "nPBrZxNc5CC76lMdsa" # <- real password, in Git forever once committed
}
```
