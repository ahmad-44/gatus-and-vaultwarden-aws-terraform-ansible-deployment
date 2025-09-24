# Gatus and VaultWarden Deployment on AWS with Docker Compose, Terraform, Ansible and Traefik

## Replication instructions:

1. Clone this repository
2. Duplicate **`./docker/.env.example`** as **`./docker/.env`** and fill the values
3. Duplicate **`./terraform/terraform.tfvars.example`** as **`../terraform/terraform.tfvars`** and fill the values
4. Create Access Key ID and Secret Access Key of the user from AWS > IAM > Users > [Select the User] > Security Credentials > Create Access Key. Copy it in a safe place.
5. Run **`aws configure`** on terminal to authenticate AWS user on your local machine
6. Navigate to **`./terraform`**
<<<<<<< HEAD
7. Run these commands [Terraform and Ansible should be installed on your machine before running these commands]
=======
7. Add your domain to AWS Route53
8. If you want to auto create DNS A records, then only run step 9 ahead. Don't need to go through step 10,11 and 12. If you want to create DNS records yourself, follow all the steps ahead. Please read ./terraform/terraform.tfvars file before proceeding.
9. Run these commands [Terraform and Ansible should be installed on your machine before running these commands]
>>>>>>> 42957d4 (Updated README.md)

   terraform init
   terraform plan
   terraform apply

10. Add first **A record** with Record Name **vault** and Value equal to public IP of EC2 instance.
11. Add second **A record** with Record Name **gatus** and Value equal to public IP of EC2 instance.
12. You will be able to access your **gatus** and **vault warden** apps at

    gatus.yourdomain.com
    vault.yourdomain.com
