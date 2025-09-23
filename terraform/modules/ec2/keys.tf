# Generate SSH key dynamically
resource "tls_private_key" "deployer" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Upload your public key to AWS as a key pair
resource "aws_key_pair" "deployer" {
  key_name   = "terraform-deployer"
  public_key = tls_private_key.deployer.public_key_openssh
}

# Save private key permanently
resource "local_file" "private_key" {
  content         = tls_private_key.deployer.private_key_pem
  filename        = "${path.root}/keys/terraform_deployer.pem"
  file_permission = "0600"
}

# Save public key permanently
resource "local_file" "public_key" {
  content         = tls_private_key.deployer.public_key_openssh
  filename        = "${path.root}/keys/terraform_deployer.pub"
  file_permission = "0644"
}
