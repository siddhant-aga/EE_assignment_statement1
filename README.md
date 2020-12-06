# EE_assignment_statement1
Equal Experts Assignment-Statement 1

![alt text](https://github.com/siddhant-aga/EE_assignment_statement1/blob/main/image.PNG?raw=true)

## Pre-requisites

Install Terraform and git.

## To deploy and run the architecture as depicted in the problem statement follow these steps:
1. Clone this repository using `git clone` command.
2. Generate your key pair to access ec2 instance using the command: `ssh-keygen -f mykey`
3. Edit *provider.tf* file with your own **Access Key** and **Secret Access Key** of your AWS account.
4. Run command `terraform init` to install the provider plugins
5. Run command: `terraform plan` to check and preview all the resources that will be created.
6. Finally run command `terraform apply` to create the resources in your AWS account.
