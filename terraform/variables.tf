variable "aws_region" {
  description = "AWS region to create resources in, defined in tfvars"
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI id to use for instance (Ubuntu), defined in tfvars"
  default     = "ami-0c94855ba95c71c99" # change for your region
}

variable "instance_type" {
  description = "EC2 instance type, defined in tfvars"
  default     = "t2.micro"
}

variable "ssh_user" {
  description = "Default SSH user for the AMI, defined in tfvars"
  default     = "ubuntu"
}

variable "ansible_playbook" {
  description = "Path to local Ansible playbook to run after provisioning"
  default     = "../ansible/setup.yml"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  default     = "terraform-ansible-web"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH (restrict this to your IP for security), defined in tfvars"
  default     = "0.0.0.0/0"
}

variable "domain" {
  description = "Domain of the app, defined in tfvars"
  default     = "example.com"
}

variable "create_route53_A_records" {
  type    = bool
  default = false
}

# variable "public_ip" {
#   description = "Public_IP of the ec2 server"
#   default     = "0.0.0.0"
# }

