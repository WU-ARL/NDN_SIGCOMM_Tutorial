#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

cd /home/ubuntu/validation

# make sure we don't have another already running:
killall ndncatchunks

# ndncatchunks command goes here:
nohup ndncatchunks -r 20 -c /home/ubuntu/validation/consumer2.cfg /ndn/edu/wustl/jdd/file_01_01.${SUFFIX} > file_01_01.png &
sleep 2
nohup ndncatchunks -r 20 -c /home/ubuntu/validation/consumer2.cfg /ndn/edu/wustl/jdd/file_01_02.${SUFFIX} > file_01_02.png &
sleep 2
nohup ndncatchunks -r 20 -c /home/ubuntu/validation/consumer2.cfg /ndn/edu/wustl/jdd/file_02_01.${SUFFIX} > file_02_01.png &
sleep 2
nohup ndncatchunks -r 20 -c /home/ubuntu/validation/consumer2.cfg /ndn/edu/wustl/jdd/file_02_02.${SUFFIX} > file_02_02.png &
sleep 2

