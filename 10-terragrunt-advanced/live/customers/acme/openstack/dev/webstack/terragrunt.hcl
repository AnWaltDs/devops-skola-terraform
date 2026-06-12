# Leaf configuration for: acme / openstack / dev / webstack
#
# This file includes three parent configs that each handle one concern:
#   root.hcl       → remote state (path derived automatically)
#   openstack.hcl  → provider generation + shared defaults
#   customer.hcl   → anchor for path-based naming
#
# The directory path itself encodes: customer, platform, environment, component.
# We parse it in locals so nothing needs to be hardcoded.

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "openstack" {
  path = find_in_parent_folders("openstack.hcl")
}

include "customer" {
  path = find_in_parent_folders("customer.hcl")
}

locals {
  # Parse identity from the directory path.
  # path_relative_to_include("root") → "customers/acme/openstack/dev/webstack"
  parts     = split("/", path_relative_to_include("root"))
  customer  = local.parts[1]  # "acme"
  platform  = local.parts[2]  # "openstack"
  env       = local.parts[3]  # "dev"
  component = local.parts[4]  # "webstack"

  name_prefix = "${local.customer}-${local.env}-${local.component}"
  # → "acme-dev-webstack"
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../../../modules/webstack"
}

# Only the values that actually differ per environment.
# Everything else comes from the includes.
inputs = {
  name_prefix         = local.name_prefix
  subnet_cidr         = "10.20.10.0/24"
  ssh_cidr            = "0.0.0.0/0"
  http_cidr           = "0.0.0.0/0"
  instance_private_ip = "10.20.10.10"
  flavor_name         = "1C-1GB"
}
