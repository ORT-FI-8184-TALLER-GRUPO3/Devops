#!/bin/bash
#Crea solamente ambiente de desarrollo

terraform workspace select dev
terraform apply -var-file="dev.tfvars" -auto-approve
