# EC2 Instance
resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = var.instance_name
  }

  connection {
    type        = "ssh"
    user        = "ubuntu" #var.ssh_user
    private_key = tls_private_key.deployer.private_key_pem
    host        = self.public_ip
    timeout     = "5m" # default
  }

  # Force Terraform to wait for SSH 
  provisioner "remote-exec" {
    inline = [
      "echo 'Instance is ready and SSH is working'"
    ]
  }

  provisioner "local-exec" {
    command = <<EOT
  # Create a temporary file for the private key
  TMP_KEY_FILE=$(mktemp)
  echo '${tls_private_key.deployer.private_key_pem}' > $TMP_KEY_FILE
  chmod 600 $TMP_KEY_FILE

  # Run Ansible playbook using temporary key file
  ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
    -i '${self.public_ip},' \
    -u ${var.ssh_user} \
    --private-key $TMP_KEY_FILE \
    ${var.ansible_playbook} \

  # Remove the temporary key file
  rm -f $TMP_KEY_FILE
  EOT

    interpreter = ["/bin/bash", "-c"]
    when        = create
  }
}
