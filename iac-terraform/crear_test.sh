#!/bin/bash
#Crea solamente ambiente de desarrollo

terraform workspace select test
terraform apply -var-file="test.tfvars" -auto-approve
