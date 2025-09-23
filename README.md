# Gatus and VaultWarden Deployment on AWS with Docker Compose, Terraform, Ansible and Traefik

## Replication instructions:

1. Clone this repository
2. Duplicate **`./docker/.env.example`** as **`./docker/.env`** and fill the values
3. Duplicate **`./terraform/terraform.tfvars.example`** as **`../terraform/terraform.tfvars`** and fill the values
4. Create Access Key ID and Secret Access Key of the user from AWS > IAM > Users > [Select the User] > Security Credentials > Create Access Key. Copy it in a safe place.
5. Run **`aws configure`** on terminal to authenticate AWS user on your local machine
6. Navigate to **`./terraform`**
7. Run these commands [Terraform and Ansible should be installed on your machine before running these commands]

   terraform init
   terraform plan
   terraform apply

8. Add your domain to AWS Route53
9. Add first **A record** with Record Name **vault** and Value equal to public IP of EC2 instance.
10. Add second **A record** with Record Name **gatus** and Value equal to public IP of EC2 instance.
11. You will be able to access your **gatus** and **vault warden** apps at

    gatus.yourdomain.com
    vault.yourdomain.com
