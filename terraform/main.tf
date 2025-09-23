module "gatus_and_vault_ec2" {
  source           = "./modules/ec2"
  ami              = var.ami
  instance_type    = var.instance_type
  ssh_user         = var.ssh_user
  ansible_playbook = local.ansible_playbook_path
  instance_name    = var.instance_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
}
