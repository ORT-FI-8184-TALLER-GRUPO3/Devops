#!/bin/bash
#destruye ambiente dev

terraform workspace select prod
terraform destroy -var-file="prod.tfvars" -auto-approve
