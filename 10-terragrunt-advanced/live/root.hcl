# root.hcl — the topmost include.
# Shared by EVERY leaf in the tree. Responsible for:
#   1. Remote state configuration (one state file per leaf, derived from the path)
#   2. Common tags applied everywhere

locals {
  common_tags = {
    managed_by = "terragrunt"
    repo       = "devops-skolan"
  }
}

# Each leaf gets its own state file automatically.
# The path is derived from the directory structure — no hardcoding needed.
remote_state {
  backend = "local"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    path = "${get_repo_root()}/state/${path_relative_to_include()}/terraform.tfstate"
    # Example result:
    #   state/customers/acme/openstack/dev/webstack/terraform.tfstate
  }
}
