#!/bin/bash
#destruye todos los ambientes

terraform workspace select dev
terraform destroy -var-file="dev.tfvars" -auto-approve
terraform workspace select test
terraform destroy -var-file="test.tfvars" -auto-approve
terraform workspace select prod
terraform destroy -var-file="prod.tfvars" -auto-approve
