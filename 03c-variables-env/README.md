# 03c — Best practice: credentials from environment variables

The provider block is empty — credentials come from `OS_*` environment variables.
No secrets in code, no secrets in tfvars. Nothing to accidentally commit.

## What improved over 03b

- No `terraform.tfvars` with passwords
- Nothing sensitive in the repo at all
- The `.envrc` (or CI secrets) provides the credentials at runtime

## How the OpenStack provider reads OS_* variables

| Environment variable     | Provider argument  |
|--------------------------|--------------------|
| `OS_AUTH_URL`            | `auth_url`         |
| `OS_TENANT_NAME`        | `tenant_name`      |
| `OS_USERNAME`            | `user_name`        |
| `OS_PASSWORD`            | `password`         |
| `OS_REGION_NAME`         | `region`           |
| `OS_USER_DOMAIN_NAME`   | `user_domain_name` |

## Tasks

1. Source the `.envrc` — `source ../.envrc` or use direnv
2. Run `tofu init && tofu plan` — it works
3. Open `main.tf` — no credentials anywhere
4. Discuss: where do the credentials come from in CI/CD?
