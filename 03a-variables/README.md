# 03a — Resource values as variables

The resource configuration (name, flavor, image) now uses variables instead of hardcoded values.
This makes the code reusable — you can deploy different VMs without editing main.tf.

## What improved over 02b

- Resource values are parameterized
- You can override them with `-var` or `terraform.tfvars`

## What is still wrong

- The **credentials are still hardcoded** in the provider block
- Next step: move those into variables too
