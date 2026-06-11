# 07 — DRY with Terraform Modules

This version solves the copy-paste problem from `06` by extracting a shared module.
All three environments reuse the same module — the resource code exists only once.

## What improved

| Before (06)                        | After (07)                        |
|------------------------------------|-----------------------------------|
| Same resources copied 3 times      | One module, called 3 times        |
| Fix a bug → edit 3 folders         | Fix a bug → edit 1 module         |
| Each folder ~80 lines of resources | Each module call ~12 lines        |

## What is still painful

This is the key discussion point for the workshop.
Modules solve code duplication, but they do **not** solve operational problems:

### 1. Shared state file
All three environments live in **one** state.
A bad `terraform apply` can destroy dev **and** prod at the same time.

### 2. No independent plan/apply
`terraform plan` always shows changes for **all** environments.
You cannot deploy just dev without risking a change to prod.
(Yes, you can use `-target`, but that is fragile and not recommended.)

### 3. Backend cannot use variables
Terraform does not allow variables in the `backend { }` block.
You cannot parameterize the state path per environment without workarounds.

### 4. One provider for everything
What if prod uses a different OpenStack project, region, or credentials?
With a single root module you are stuck with one provider configuration.

### 5. Outputs grow linearly
Every new environment needs its own output block — more boilerplate.

## How Terragrunt fixes these (preview of 08)

| Problem                     | Terragrunt solution                             |
|-----------------------------|--------------------------------------------------|
| Shared state                | Each `live/<env>` gets its own state automatically |
| No independent deploy       | `cd live/dev && terragrunt apply` — only dev     |
| Backend not parameterizable | `remote_state { }` with path templates           |
| Single provider             | `generate "provider"` per environment            |
| Output boilerplate          | Outputs come from the module, no wrapper needed  |

## Tasks

1. Read `main.tf` — notice the four problem comments
2. Run `terraform plan` and observe that all three environments appear
3. Discuss: what happens if someone runs `terraform destroy` here?
4. Compare with `08-with-terragrunt`

## Discussion prompt

> Modules keep your code DRY.
> Terragrunt keeps your **operations** DRY.
> When do you need which?
