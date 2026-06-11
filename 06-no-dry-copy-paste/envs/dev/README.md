# DEV environment

This folder repeats the same OpenStack web stack as the other environments.

## Goal
Run the same pattern three times and see where copy-paste starts to hurt.

## Tasks
1. Copy `terraform.tfvars.example` to `terraform.tfvars`
2. Adjust the credentials
3. Run `terraform init`
4. Run `terraform plan`
5. Compare this folder with `dev`, `test`, and `prod`

## Discussion prompt
What happens when the stack changes and you have to edit it in three places?
