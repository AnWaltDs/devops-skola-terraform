# Terraform Hands-On: OpenStack Starter Repo

This repository is designed for a beginner-friendly Terraform workshop.

## Prerequisites

- **Git**
- **OpenTofu (`tofu`)**
- **Terragrunt** — only needed for `09-with-terragrunt` and `10-terragrunt-advanced`

### Install guide

**Windows**

The `.envrc` files use Bash syntax (`export VAR=...`) and the exercise READMEs tell you to run `source ../.envrc`. This does **not** work in PowerShell or cmd.exe — do the whole workshop in **Git Bash**, which you get from the Git for Windows installer below.

```
winget install Git.Git
winget install OpenTofu.Tofu
winget install Gruntwork.Terragrunt
```

Skip `direnv` — it's built for Unix shells and adds setup overhead for little benefit here. Just run `source ../.envrc` manually in Git Bash, as the exercise READMEs suggest.

**macOS**

```
brew install git opentofu terragrunt
```

**Linux**

Use your distro's package manager for `git`. For OpenTofu and Terragrunt, follow the official install scripts:
- OpenTofu: https://opentofu.org/docs/intro/install/
- Terragrunt: https://docs.terragrunt.com/getting-started/install/

### Verify

```
git --version
tofu --version
terragrunt --version
```

## Goal

Participants move from a broken example to a clean, reusable Terraform setup in small steps:

1. **00-broken** — resource only, no provider, no credentials
2. **01-provider** — add provider block, but still no credentials
3. **02a-hardcoded-fake** — hardcoded fake credentials (plan works, API untested)
4. **02b-hardcoded-real** — hardcoded real credentials (plan connects to API — anti-pattern!)
5. **03a-variables** — resource values as variables, but credentials still hardcoded
6. **03b-variables-tfvars** — credentials also as variables, values in terraform.tfvars
7. **03c-variables-env** — best practice: empty provider, credentials from OS_* env vars
5. **04a-outputs** — expose useful outputs
6. **04b-outputs-consumed** — how resources reference each other (implicit dependencies)
7. **05-clean-final** — a tidy final version
7. **06-no-dry-copy-paste** — the copy-paste anti-pattern across environments
8. **07-dry-with-modules** — DRY with modules, but all envs share one state
9. **08-dry-envs-with-module** — env folders + shared module (pure Terraform, production-ready)
10. **09-with-terragrunt** — Terragrunt eliminates the remaining boilerplate
11. **10-terragrunt-advanced** — multi-level includes, path-based identity, real-world pattern

## Workshop Flow

Each folder is a standalone exercise.

Typical teaching sequence:

- Run `terraform init`
- Run `terraform plan`
- Observe the failure
- Add the missing piece
- Re-run `terraform plan`
- Move to the next stage

## Notes

- The OpenStack provider block uses placeholders on purpose.
- Replace them with your lab credentials or environment variables.
- The repository is intentionally small so students can focus on the Terraform fundamentals.

## Suggested Talking Points

- Terraform needs a provider to talk to a platform.
- Hardcoded values work, but they are not scalable.
- Variables make code reusable.
- Outputs help users consume what Terraform created.
