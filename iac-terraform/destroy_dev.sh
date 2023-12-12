#!/bin/bash
#destruye ambiente dev

terraform workspace select dev
terraform destroy -var-file="dev.tfvars" -auto-approve
