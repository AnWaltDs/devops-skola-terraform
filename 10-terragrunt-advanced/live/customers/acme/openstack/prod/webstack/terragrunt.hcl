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
  parts     = split("/", path_relative_to_include("root"))
  customer  = local.parts[1]
  env       = local.parts[3]
  component = local.parts[4]

  name_prefix = "${local.customer}-${local.env}-${local.component}"
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../../../modules/webstack"
}

inputs = {
  name_prefix         = local.name_prefix
  subnet_cidr         = "10.20.30.0/24"
  ssh_cidr            = "10.0.0.0/8"
  http_cidr           = "0.0.0.0/0"
  instance_private_ip = "10.20.30.10"
  flavor_name         = "1C-1GB"
}
