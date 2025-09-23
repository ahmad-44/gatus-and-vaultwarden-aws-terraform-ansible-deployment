output "public_ip" {
  description = "Public IP of created EC2 instance"
  value       = module.gatus_and_vault_ec2.public_ip
}

output "instance_id" {
  value = module.gatus_and_vault_ec2.instance_id
}
