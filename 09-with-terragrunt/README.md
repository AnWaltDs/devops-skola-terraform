# with-terragrunt

This version keeps the module reusable and the environments thin.

## Structure
- `modules/webstack` contains the real Terraform implementation
- `live/dev`, `live/test`, `live/prod` only provide environment-specific inputs
- `terragrunt.hcl` at the root shares provider generation and common settings

## Learning goals
- See how Terragrunt reduces duplication
- Keep module code central
- Keep environment folders small and readable
- Scale from a few environments to many without copy-paste
