output "public_ip" {
  description = "Public IP of created EC2 instance"
  value       = module.ec2.public_ip
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "route53_records" {
  description = "Info about the Route53 records created"
  value = var.create_route53_A_records ? [
    "A record created for ${module.ec2.public_ip} with subdomain ${module.route53[0].records_map["gatus"]}",
    "A record created for ${module.ec2.public_ip} with subdomain ${module.route53[0].records_map["vault"]}"
  ] : []
}
