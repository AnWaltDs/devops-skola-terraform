# Deploy the dev web stack using the shared module.
module "dev" {
  source = "./modules/webstack"

  name_prefix         = "dev-web"
  subnet_cidr         = "10.20.10.0/24"
  ssh_cidr            = "0.0.0.0/0"
  http_cidr           = "0.0.0.0/0"
  instance_private_ip = "10.20.10.10"
  image_name          = var.image_name
  flavor_name         = "1C-1GB"
}

# Deploy the test web stack using the shared module.
module "test" {
  source = "./modules/webstack"

  name_prefix         = "test-web"
  subnet_cidr         = "10.20.20.0/24"
  ssh_cidr            = "0.0.0.0/0"
  http_cidr           = "0.0.0.0/0"
  instance_private_ip = "10.20.20.10"
  image_name          = var.image_name
  flavor_name         = "1C-1GB"
}

# Deploy the prod web stack using the shared module.
module "prod" {
  source = "./modules/webstack"

  name_prefix         = "prod-web"
  subnet_cidr         = "10.20.30.0/24"
  ssh_cidr            = "0.0.0.0/0"
  http_cidr           = "0.0.0.0/0"
  instance_private_ip = "10.20.30.10"
  image_name          = var.image_name
  flavor_name         = "1C-1GB"
}
