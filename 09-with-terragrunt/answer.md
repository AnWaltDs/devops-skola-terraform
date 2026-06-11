# Answer

Each environment is just one `terragrunt.hcl` file (~15 lines). No `provider.tf`, no `variables.tf`, no `outputs.tf` to repeat. Inputs go directly into the `terragrunt.hcl`, outputs come from the module automatically.

```
08: envs/dev/ = 5 files (provider.tf, variables.tf, outputs.tf, main.tf, tfvars)
09: live/dev/ = 1 file  (terragrunt.hcl)
```
