# Answer

The three files are almost identical. Only names, CIDRs, and sizes differ. Every change must be copied to all three folders. The more environments you have, the worse it gets.

```
envs/dev/main.tf   ~70 lines
envs/test/main.tf  ~70 lines  (same structure, different values)
envs/prod/main.tf  ~70 lines  (same structure, different values)
```
