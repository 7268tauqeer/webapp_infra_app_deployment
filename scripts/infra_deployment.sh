#!/bin/bash

# Stage1
#Terraform Init

cd infra_deployment/
terraform init --backed-config config/backend.conf

#Stage 2
#Terraform Plan
terrform plan 

#Stage 3
#Terraform apply
terraform apply -auto-approve
