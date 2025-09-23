# in variables.tf of root, default value of the variable was not able to hold ${path.root}. So we use locals. 
locals {
  ansible_playbook_path = "${path.root}/../ansible/setup.yml"
}
