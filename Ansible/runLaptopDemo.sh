#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

#ansible-playbook -u ubuntu --ssh-extra-args="-i ~/.ssh/aws_wu_jdd.pem -o \"StrictHostKeyChecking no\"" --ask-vault-pass -i inventory --extra-vars "suffix=${SUFFIX}" runDemoValidation.yml

pushd ../Laptop
./runAllConsumers.sh ${SUFFIX}

sleep 5

pushd ./image_slicer
nohup ./join_show_image_consumer1.sh ../CONSUMER1 &
nohup ./join_show_image_consumer2.sh ../CONSUMER2 &
nohup ./join_show_image_consumer3.sh ../CONSUMER3 &

sleep 5

popd
popd

