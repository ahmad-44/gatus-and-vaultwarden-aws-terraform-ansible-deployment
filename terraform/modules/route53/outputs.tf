# this output will be catched by root module and printed in human friendly way
output "records_map" {
  description = "FQDNs of created Route53 records"
  value = {
    gatus = aws_route53_record.gatus.fqdn
    vault = aws_route53_record.vault.fqdn
  }
}

/*  Example output of the block above

records_map = {
  "gatus" = "gatus.example.com."
  "vault" = "vault.example.com."
}

*/
