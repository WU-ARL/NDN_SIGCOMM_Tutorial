#!/bin/bash

#if [ $# -eq 1 ]
#then
#  SUFFIX=$1
#else
#  echo "need to give a suffix"
#  exit 0
#fi

ansible-playbook --ask-vault-pass launch-validation.yml

ansible-playbook -u ubuntu --ssh-extra-args="-i ~/.ssh/aws_wu_jdd.pem -o \"StrictHostKeyChecking no\"" --ask-vault-pass -i inventory configure-with-ami-validation.yml

#./runValidationDemoProducers.sh $SUFFIX

#echo "Hit return when ready to run Consumers"
#
#read result
#
#./runLaptopDemo.sh $SUFFIX
#
#./runValidationDemoConsumers.sh $SUFFIX

