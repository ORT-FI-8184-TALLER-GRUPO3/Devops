#!/bin/bash
#destruye ambiente dev

terraform workspace select test
terraform destroy -var-file="test.tfvars" -auto-approve
