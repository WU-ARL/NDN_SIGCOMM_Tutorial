#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

# kill any ndncatchunks and ndnputchunks
killall ndncatchunks
killall ndnputchunks

