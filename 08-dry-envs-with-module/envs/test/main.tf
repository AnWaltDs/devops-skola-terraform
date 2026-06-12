# Deploy the test web stack using the shared module.
module "webstack" {
  source = "../../modules/webstack"

  name_prefix         = var.name_prefix
  subnet_cidr         = var.subnet_cidr
  ssh_cidr            = var.ssh_cidr
  http_cidr           = var.http_cidr
  instance_private_ip = var.instance_private_ip
  image_name          = var.image_name
  flavor_name         = var.flavor_name
}
