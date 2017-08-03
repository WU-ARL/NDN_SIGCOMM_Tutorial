#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

# make sure there is not already one running
killall ndncatchunks

ndncatchunks -s 10  -r 20 /ndn/edu/wustl/jdd/testfile.5MB.${SUFFIX} > testfile.5MB.${SUFFIX} &

