#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

ansible-playbook -u ubuntu --ssh-extra-args="-i ~/.ssh/aws_wu_jdd.pem -o \"StrictHostKeyChecking no\"" --ask-vault-pass -i inventory --extra-vars "suffix=${SUFFIX}" runDemoValidationConsumers.yml

