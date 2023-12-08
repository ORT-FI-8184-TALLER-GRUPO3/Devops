#!/bin/bash
#Crea todos los ambientes

terraform workspace select dev
terraform apply -var-file="dev.tfvars" -auto-approve
terraform workspace select test
terraform apply -var-file="test.tfvars" -auto-approve
terraform workspace select prod
terraform apply -var-file="prod.tfvars" -auto-approve