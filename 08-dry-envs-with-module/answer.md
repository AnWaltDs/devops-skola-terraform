# Answer

`provider.tf`, `variables.tf`, `outputs.tf`, and even `main.tf` are identical in all three folders. Only `terraform.tfvars` has different values per environment.

```
envs/dev/provider.tf   = envs/test/provider.tf   = envs/prod/provider.tf
envs/dev/variables.tf  = envs/test/variables.tf  = envs/prod/variables.tf
envs/dev/outputs.tf    = envs/test/outputs.tf    = envs/prod/outputs.tf
envs/dev/main.tf       = envs/test/main.tf       = envs/prod/main.tf

envs/dev/terraform.tfvars  ≠  envs/test/terraform.tfvars  ≠  envs/prod/terraform.tfvars
```

Adding a staging environment means copying a folder, adjusting the values in `terraform.tfvars`, and remembering to update the backend key. Four identical files duplicated for one file that actually differs — that's the boilerplate Terragrunt eliminates.
