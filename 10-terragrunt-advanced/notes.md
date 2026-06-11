# Trainer notes

## Goal

Show that the simple Terragrunt pattern from 09 scales to real-world complexity
by layering includes. Each include handles one concern. The leaf stays thin.

## Teaching flow

1. Start by showing the directory tree — let students read the path like a sentence:
   "customers / acme / openstack / dev / webstack"
2. Open the leaf terragrunt.hcl — point out what is NOT there:
   no provider, no backend, no variable definitions, no outputs wrapper.
3. Walk up the tree: openstack.hcl generates the provider, root.hcl handles state.
4. Show the locals block that parses the path — this is usually the "aha" moment.
5. End with the real-world example from the KPS project to show it is not academic.

## Common questions

- "Isn't this over-engineered for 3 environments?"
  → Yes. This pattern shines at 10+ environments, multiple customers, or multiple platforms.
  For a small setup, 09 is perfectly fine.

- "Can I override an include?"
  → Yes. A deeper include or the leaf itself can override generated files or inputs.
  Terragrunt merges inputs, and generate blocks can use if_exists = "overwrite".

- "What is expose = true?"
  → It makes the locals of an include available in the leaf via include.<name>.locals.<key>.
  Useful when a mid-level config holds values the leaf needs in its inputs block
  (e.g. vdc.hcl holds sizing_policy_id, the leaf uses it in worker_pools).

- "Why split root.hcl and openstack.hcl? Why not one file?"
  → Separation of concerns. root.hcl applies to ALL stacks (state, tags).
  openstack.hcl applies only to OpenStack stacks. If you add AWS stacks,
  they get a different aws.hcl but share the same root.hcl.

## Whiteboard sketch

Draw this on the board:

  root.hcl ─────────────── state + tags (everything)
       │
  customer.hcl ─────────── path anchor (per customer)
       │
  openstack.hcl ────────── provider + defaults (per platform)
       │
  terragrunt.hcl (leaf) ── env-specific values only
