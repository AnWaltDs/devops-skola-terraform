# openstack.hcl — provider-level include.
# Shared by all environments of this customer on this platform.
# Responsible for:
#   1. Generating the OpenStack provider block
#   2. Holding connection details that are the same across dev/test/prod

# Generate the provider block so leaf configs never need to define it.
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
    terraform {
      required_version = ">= 1.6.0"
      required_providers {
        openstack = {
          source  = "terraform-provider-openstack/openstack"
          version = "~> 1.54"
        }
      }
    }

    provider "openstack" {
      # Credentials come from environment variables:
      #   OS_AUTH_URL, OS_TENANT_NAME, OS_USERNAME, OS_PASSWORD, OS_REGION_NAME
      # This keeps secrets out of code entirely.
    }
  EOF
}

# Inputs shared across all environments for this customer + platform.
inputs = {
  image_name    = "Ubuntu 22.04"
  key_pair_name = "training-key"
}
