# 03b — All values in terraform.tfvars

Now the credentials are also variables — no secrets in `main.tf` anymore.
The values live in `terraform.tfvars`.

## What improved over 03a

- Provider block is clean — no secrets visible in the code
- All values can be changed without editing main.tf

## What is still painful

- `terraform.tfvars` still contains the password in plain text
- Commit `terraform.tfvars` to Git → same problem as 02b
- You need `.gitignore` for `*.tfvars` — easy to forget

## Tasks

1. Run `tofu init && tofu plan` — works without envrc
2. Open `terraform.tfvars` — the password is still there
3. Discuss: is this really better than hardcoding?
4. Move on to 03c — best practice with environment variables
