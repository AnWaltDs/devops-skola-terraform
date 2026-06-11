# 08 — Env Folders + Shared Module (pure Terraform)

This version combines the best parts of 06 and 07:
- A **shared module** so the resource code exists only once (like 07)
- **Separate env folders** so each environment has its own state (like 06)

No extra tools needed — this is pure Terraform.

## Structure

```
08-dry-envs-with-module/
├── modules/webstack/          # shared module — written once
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── envs/
    ├── dev/                   # own state, own provider, own plan/apply
    │   ├── provider.tf
    │   ├── main.tf            # just calls the module
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── terraform.tfvars.example
    ├── test/
    └── prod/
```

## What improved over 07

| Problem in 07                    | Fixed in 08                                  |
|----------------------------------|----------------------------------------------|
| One shared state for all envs    | Each env folder has its own state             |
| Cannot plan/apply just one env   | `cd envs/dev && terraform apply` — only dev   |
| One provider for everything      | Each env can have its own provider config     |

## What is still painful

This is the key discussion point — this approach works, but it has friction:

### 1. Boilerplate per environment
Every env folder repeats `provider.tf`, `variables.tf`, `outputs.tf` and `terraform.tfvars.example`.
The files are nearly identical. Add a new provider variable → edit all env folders.

### 2. Backend key is hardcoded
The `backend "s3" { key = "dev/..." }` path must be hardcoded per environment.
You cannot template it. Copy-paste a new env → forget to change the key → state collision.

### 3. Provider version pinning repeated
The `required_providers` block is copied into every env. Bump a version → edit every folder.

### 4. No orchestration across environments
Want to apply dev, then test, then prod in order? Write a script or do it manually.
Terragrunt gives you `run-all apply` with dependency ordering.

### 5. Scales linearly
10 environments = 10 folders with the same boilerplate.
The module stays DRY, but the wrapper code grows.

## How Terragrunt improves on this (preview of 09)

| Remaining problem       | Terragrunt solution                                      |
|-------------------------|-----------------------------------------------------------|
| Repeated provider.tf    | `generate "provider"` in root `terragrunt.hcl` — once    |
| Hardcoded backend key   | `remote_state { }` with `path_relative_to_include()`     |
| Repeated variables.tf   | Inputs come from `terragrunt.hcl` — no wrapper variables  |
| No orchestration        | `terragrunt run-all plan` across all environments         |
| Linear boilerplate      | Each env is just one `terragrunt.hcl` file (~15 lines)    |

## Tasks

1. Compare `envs/dev/main.tf` with `envs/prod/main.tf` — spot the differences
2. Count how many files are identical across the three env folders
3. Run `cd envs/dev && terraform plan` — notice only dev appears
4. Discuss: what happens when you add a 4th environment?
5. Compare with `09-with-terragrunt`

## Discussion prompt

> This pattern is production-ready and used by many teams.
> Terragrunt reduces the boilerplate, but adds a tool dependency.
> Which trade-off fits your team?
