#!/bin/bash

#para crear los workspaces, se realiza solamente una vez

terraform workspace new dev
terraform workspace new test
terraform workspace new prod
