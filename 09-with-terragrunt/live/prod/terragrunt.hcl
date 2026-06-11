include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/webstack"
}

inputs = {
  name_prefix         = "prod-web"
  subnet_cidr         = "10.20.30.0/24"
  ssh_cidr            = "0.0.0.0/0"
  http_cidr           = "0.0.0.0/0"
  instance_private_ip = "10.20.30.10"
  image_name = "Ubuntu 22.04"
  flavor_name = "m1.medium"
  key_pair_name = "training-key"
}
