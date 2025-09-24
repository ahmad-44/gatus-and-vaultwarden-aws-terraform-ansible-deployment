# Call ec2 module to create ec2 machine
module "ec2" {
  source           = "./modules/ec2"
  ami              = var.ami
  instance_type    = var.instance_type
  ssh_user         = var.ssh_user
  ansible_playbook = local.ansible_playbook_path
  instance_name    = var.instance_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

# Call route53 module to create A records for gatus and vaultwarden

module "route53" {
  count     = var.create_route53_A_records ? 1 : 0 #if it is true in tfvars, module will run, else, it will skip
  source    = "./modules/route53"
  public_ip = module.ec2.public_ip # inject EC2 IP here
  domain    = var.domain
}
