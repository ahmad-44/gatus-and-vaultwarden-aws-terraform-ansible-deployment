# select the zone dynamically for your domain (defined in tfvars)
data "aws_route53_zone" "selected" {
  name = var.domain
}

# create A record for Gatus
resource "aws_route53_record" "gatus" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "gatus.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [var.public_ip]
}

# create A record for VaultWarden
resource "aws_route53_record" "vault" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "vault.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = [var.public_ip]
}
