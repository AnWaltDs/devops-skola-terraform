# Trainer notes

This step is the bridge between the copy-paste anti-pattern (06) and the Terragrunt solution (08).

## Key teaching moment

Let the students discover the problems themselves:

1. Show them the module structure — they will feel the improvement over 06.
2. Then ask: "What happens if I run terraform destroy?"
   -> Answer: everything is gone. Dev, test, prod. One state file.
3. Ask: "Can I deploy only dev?"
   -> Answer: not cleanly. -target is a hack, not a workflow.
4. Ask: "What if prod needs different credentials?"
   -> Answer: you need a second provider alias, which gets messy fast.

Only then move to 08 and show how Terragrunt solves each of these.

## Common student questions

- "Can't I just use workspaces?" — Yes, workspaces give separate state per environment,
  but they still share one backend config and one provider block. They also hide which
  environment is active, which is error-prone. Discuss trade-offs.
- "Why not just separate root modules per env?" — That is exactly what 06 does,
  and that is the copy-paste problem we started with.
