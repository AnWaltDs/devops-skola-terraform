# Answer

OS_* environment variables. No secrets in any file. In CI/CD the same vars come from pipeline secrets.

```hcl
provider "openstack" {} # <- reads OS_AUTH_URL, OS_USERNAME, OS_PASSWORD, etc.
```
