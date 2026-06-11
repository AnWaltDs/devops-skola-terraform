# Answer

All three environments share one state file. `tofu plan` shows changes for dev, test, and prod together. You cannot deploy just one environment independently. `tofu destroy` would destroy everything at once.

```
Plan: 15 to add   <- dev + test + prod, all in one plan
```
