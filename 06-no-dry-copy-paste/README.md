# no-dry-copy-paste

This version is intentionally bad.
It shows the anti-pattern first: three environments with almost the same Terraform code copied into each folder.

## What to notice
- Dev, test, and prod repeat the same resource graph
- Only names, CIDRs, and sizes change
- Any fix must be copied everywhere
- The bigger the estate, the worse this gets

## Suggested workshop flow
1. Open `envs/dev`
2. Duplicate the same discussion for `envs/test` and `envs/prod`
3. Ask what happens when 100 more environments appear
4. Refactor the pattern into modules + Terragrunt in the second repo
