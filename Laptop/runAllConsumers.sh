#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

killall ndncatchunks

# ./startNFD.sh

cp /Users/jdd/Google\ Drive/NDN/NDN_CRI/NDN_SIGCOMM_Tutorial/Ansible/roles/validation/files/producer*.cert PRODUCERS
pushd CONSUMER1/
./runConsumers.sh ${SUFFIX}
popd 

pushd CONSUMER2/
./runConsumers.sh ${SUFFIX}
popd 

pushd CONSUMER3/
./runConsumers.sh ${SUFFIX}
popd 

