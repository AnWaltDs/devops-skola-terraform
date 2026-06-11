# Trainer notes

This step shows that pure Terraform CAN solve the multi-env problem — without Terragrunt.
Many production teams use exactly this pattern. It is important that students see this
as a valid option, not just as a stepping stone.

## Key teaching moment

1. Open `envs/dev/main.tf` — it is only ~12 lines. The module does the heavy lifting.
2. Open `envs/dev/provider.tf` and `envs/test/provider.tf` side by side.
   Ask: "What is different?" → Almost nothing. That is the boilerplate problem.
3. Count the identical files: provider.tf, variables.tf, outputs.tf, terraform.tfvars.example
   are nearly the same in all three folders. Only main.tf has real differences.
4. Ask: "What do you need to change to add a staging environment?"
   → Copy a folder, change 5 values, done. But also: remember to change the backend key.

## When to recommend this pattern

- Small teams (2-5 envs) where adding Terragrunt is not worth the complexity
- Teams that want to stay with pure Terraform tooling (CI, linting, etc.)
- Organizations where introducing a new tool requires approval

## When Terragrunt wins

- 10+ environments or environments created dynamically
- Backend config needs to be DRY (compliance, consistency)
- Cross-environment orchestration is needed (run-all, dependencies)
