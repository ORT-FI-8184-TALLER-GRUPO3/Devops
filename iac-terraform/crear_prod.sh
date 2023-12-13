#!/bin/bash
#Crea solamente ambiente de desarrollo

terraform workspace select prod
terraform apply -var-file="prod.tfvars" -auto-approve
