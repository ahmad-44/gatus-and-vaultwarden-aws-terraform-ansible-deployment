# Security Group
resource "aws_security_group" "web_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow SSH, HTTP and HTTPS"

  # rules of sg are stateful unlike NACLs. Only define one of inbound or outbound and its counterpart will be implied automatically
  ingress {
    description = "Allowed inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "Allowed inbound HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allowed inbound HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allowed outbound All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}
