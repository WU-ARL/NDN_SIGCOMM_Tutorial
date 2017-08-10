#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

cd /Users/jdd/Google\ Drive/NDN/NDN_CRI/NDN_SIGCOMM_Tutorial/Laptop/CONSUMER3

# make sure we don't have another already running:
#killall ndncatchunks

# ndncatchunks command goes here:
nohup ndncatchunks -r 20 -c /Users/jdd/Google\ Drive/NDN/NDN_CRI/NDN_SIGCOMM_Tutorial/Laptop/CONSUMER3/consumer3.cfg /ndn/edu/wustl/jdd/file_01_01.${SUFFIX} > file_01_01.png &
sleep 2
nohup ndncatchunks -r 20 -c /Users/jdd/Google\ Drive/NDN/NDN_CRI/NDN_SIGCOMM_Tutorial/Laptop/CONSUMER3/consumer3.cfg /ndn/edu/wustl/jdd/file_01_02.${SUFFIX} > file_01_02.png &
sleep 2
nohup ndncatchunks -r 20 -c /Users/jdd/Google\ Drive/NDN/NDN_CRI/NDN_SIGCOMM_Tutorial/Laptop/CONSUMER3/consumer3.cfg /ndn/edu/wustl/jdd/file_02_01.${SUFFIX} > file_02_01.png &
sleep 2
nohup ndncatchunks -r 20 -c /Users/jdd/Google\ Drive/NDN/NDN_CRI/NDN_SIGCOMM_Tutorial/Laptop/CONSUMER3/consumer3.cfg /ndn/edu/wustl/jdd/file_02_02.${SUFFIX} > file_02_02.png &
sleep 2

