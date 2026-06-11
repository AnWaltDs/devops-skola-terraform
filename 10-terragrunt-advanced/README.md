# 10 — Terragrunt Advanced: Multi-Level Includes

This version shows how Terragrunt scales to real-world setups with
multiple customers, platforms, and environments — using the directory
tree itself as the source of truth.

## The core idea

> The path **is** the identity.
> `customers/acme/openstack/dev/webstack` tells you everything:
> who, where, which stage, what component.

Each level in the tree has its own `.hcl` file that handles one concern.
Leaf configs include them all and inherit their settings automatically.

## Directory structure

```
live/
├── root.hcl                             # remote state + common tags
└── customers/
    ├── customer.hcl                     # anchor for path derivation
    └── acme/
        └── openstack/
            ├── openstack.hcl            # provider generation + shared defaults
            ├── dev/
            │   └── webstack/
            │       └── terragrunt.hcl   # leaf — only env-specific values
            ├── test/
            │   └── webstack/
            │       └── terragrunt.hcl
            └── prod/
                └── webstack/
                    └── terragrunt.hcl

modules/
└── webstack/                            # shared Terraform module
```

## Include hierarchy

```
┌─────────────────────────────────────────────────────────┐
│  root.hcl                                               │
│  - remote_state with path_relative_to_include()         │
│  - common_tags                                          │
├─────────────────────────────────────────────────────────┤
│  customer.hcl                                           │
│  - anchor for path derivation                           │
│  - (could hold: cost center, SLA, contact)              │
├─────────────────────────────────────────────────────────┤
│  openstack.hcl                                          │
│  - generate "provider" block                            │
│  - shared inputs (image_name, key_pair_name)            │
├─────────────────────────────────────────────────────────┤
│  terragrunt.hcl (leaf)                                  │
│  - includes all three parents                           │
│  - parses path → customer, env, component               │
│  - passes only env-specific inputs (CIDR, flavor, etc.) │
└─────────────────────────────────────────────────────────┘
```

## How it works

### 1. `find_in_parent_folders()` walks up the tree
Each `include` block searches upward for a named file.
This means you can nest arbitrarily deep — the right config is always found.

### 2. `path_relative_to_include("root")` encodes identity
The leaf at `customers/acme/openstack/dev/webstack` splits that path to extract:
- `customer = "acme"`
- `env = "dev"`
- `component = "webstack"`

No variables needed. Rename the folder → the name changes everywhere.

### 3. `generate` creates files you never write
`openstack.hcl` generates `provider.tf` into every leaf.
Add a new environment folder → it gets the provider automatically.

### 4. `remote_state` + path = unique state per leaf
The state path is `state/customers/acme/openstack/dev/webstack/terraform.tfstate`.
No hardcoded backend keys. No risk of state collision.

### 5. `inputs` merge across includes
`openstack.hcl` sets `image_name` and `key_pair_name`.
The leaf adds `subnet_cidr`, `flavor_name`, etc.
Terragrunt merges them before passing to the module.

## Comparison with 09 (simple Terragrunt)

| Aspect                  | 09 (simple)                          | 10 (advanced)                              |
|-------------------------|--------------------------------------|--------------------------------------------|
| Include files           | 1 root `terragrunt.hcl`             | Multiple: root, customer, platform         |
| Provider config         | Manual or missing                    | Auto-generated via `generate`              |
| Naming                  | Hardcoded in inputs                  | Derived from path — zero duplication       |
| State path              | Manual or simple                     | `path_relative_to_include()` — automatic   |
| Multi-customer          | Not designed for it                  | Built-in: add a folder per customer        |
| Multi-platform          | Not designed for it                  | Built-in: openstack.hcl, aws.hcl, etc.    |

## Real-world example

This pattern is based on a production layout:

```
infra-live/
├── root.hcl
└── customers/
    ├── customer.hcl
    └── cust-a/
        └── vmware-vcd/
            ├── vcd.hcl              ← like our openstack.hcl
            └── dev/
                └── dc1-tanzu/
                    ├── vdc.hcl      ← extra level: datacenter config
                    └── single-cluster/
                        └── cluster/
                            └── terragrunt.hcl
```

The leaf includes `root.hcl`, `vcd.hcl`, `vdc.hcl`, and `customer.hcl`.
It uses `expose = true` on `vdc.hcl` to read datacenter-specific locals
(catalog, sizing policy, storage profile) directly in the inputs block.

## Tasks

1. Read `dev/webstack/terragrunt.hcl` — notice there is no provider, no backend, no variable definitions
2. Trace where the provider comes from → `openstack.hcl`
3. Trace where the state path comes from → `root.hcl`
4. Add a new customer: copy `acme/` to `beta/` — what needs to change?
5. Add a new platform: what file would you create next to `openstack.hcl`?

## Discussion prompts

> The directory tree is your CMDB. Is that a good idea?

> What happens when a customer needs a completely different provider version?
> (Answer: override `generate "provider"` in a deeper include or in the leaf.)

> How deep is too deep?
