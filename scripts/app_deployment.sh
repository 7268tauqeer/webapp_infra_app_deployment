#!/bin/bash

# Stage1
#Terraform Init

cd app_deployment/
terraform init --backed-config config/backend.conf

#Stage 2
#Terraform Plan
terrform plan 

#Stage 3
#Terraform apply
terraform apply -auto-approve

#Stage 4
# Update ASG with the freshly backed ami
cd ../infra_deployment
terraform plan -var 'min_size=1' -var 'max_size=2'
terraform apply -var 'min_size=1' -var 'max_size=2'

