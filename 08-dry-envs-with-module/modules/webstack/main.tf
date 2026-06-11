# Create a private network.
resource "openstack_networking_network_v2" "this" {
  name           = "${var.name_prefix}-network"
  admin_state_up = true
}

# Create a subnet inside the network.
resource "openstack_networking_subnet_v2" "this" {
  name       = "${var.name_prefix}-subnet"
  network_id = openstack_networking_network_v2.this.id
  cidr       = var.subnet_cidr
  ip_version = 4
}

# Create a security group.
resource "openstack_networking_secgroup_v2" "this" {
  name                 = "${var.name_prefix}-secgroup"
  description          = "Security group for the training web stack"
  delete_default_rules = false
}

# Allow SSH traffic.
resource "openstack_networking_secgroup_rule_v2" "ssh_ingress" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.ssh_cidr
  security_group_id = openstack_networking_secgroup_v2.this.id
}

# Allow HTTP traffic.
resource "openstack_networking_secgroup_rule_v2" "http_ingress" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = var.http_cidr
  security_group_id = openstack_networking_secgroup_v2.this.id
}

# Create a network port with a fixed IP.
resource "openstack_networking_port_v2" "this" {
  name               = "${var.name_prefix}-port"
  network_id         = openstack_networking_network_v2.this.id
  admin_state_up     = true
  security_group_ids = [openstack_networking_secgroup_v2.this.id]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.this.id
    ip_address = var.instance_private_ip
  }
}

# Deploy a web server instance.
resource "openstack_compute_instance_v2" "this" {
  name        = "${var.name_prefix}-vm"
  image_name  = var.image_name
  flavor_name = var.flavor_name
  key_pair    = var.key_pair_name

  network {
    port = openstack_networking_port_v2.this.id
  }

  user_data = <<-EOT
  #cloud-config
  packages:
    - nginx
  runcmd:
    - [ sh, -c, 'echo "hello from ${var.name_prefix}" > /var/www/html/index.html' ]
    - [ systemctl, enable, --now, nginx ]
  EOT
}
