# Workshop Guide

## Learning objective

Show the progression from a failing Terraform configuration to a reusable one.

## Exercises

### 00-broken
- Purpose: demonstrate that a resource alone is not enough.
- Expected result: Terraform fails because the provider is missing.

### 01-provider
- Purpose: add the OpenStack provider block.
- Expected result: Terraform can initialize and read the configuration.

### 02-hardcoded
- Purpose: show a working but ugly example.
- Expected result: resource values are hardcoded.

### 03-variables
- Purpose: move values into variables.
- Expected result: the configuration becomes reusable.

### 04-outputs
- Purpose: expose values that users may need after deployment.
- Expected result: Terraform prints a useful output.

### 05-clean-final
- Purpose: a tidy final version for reference.
- Expected result: small, readable, and parameterized configuration.
