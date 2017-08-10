#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

killall ndncatchunks

pushd CONSUMER1/
./runConsumers.sh ${SUFFIX}
popd 

pushd CONSUMER2/
./runConsumers.sh ${SUFFIX}
popd 

pushd CONSUMER3/
./runConsumers.sh ${SUFFIX}
popd 

