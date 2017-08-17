#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

cd /home/ubuntu/validation

# make sure we don't have one running already
killall ndnputchunks

#NDN_ID=`ndnsec-ls-identity | awk '{print $2}'`

# ndnputchunks command goes here:
#nohup ndnputchunks -S id:${NDN_ID} /ndn/edu/wustl/jdd/file_01_01.${SUFFIX} < bob_01_01.png &
#nohup ndnputchunks -S id:${NDN_ID} /ndn/edu/wustl/jdd/file_01_02.${SUFFIX} < bob_01_02.png &
#nohup ndnputchunks -S id:${NDN_ID} /ndn/edu/wustl/jdd/file_02_01.${SUFFIX} < bob_02_01.png &
#nohup ndnputchunks -S id:${NDN_ID} /ndn/edu/wustl/jdd/file_02_02.${SUFFIX} < bob_02_02.png &

nohup ndnputchunks -S id:/producer1 /ndn/edu/wustl/jdd/file_01_01.${SUFFIX} < bob_01_01.png >& producer1.log &
sleep 2
nohup ndnputchunks -S id:/producer2 /ndn/edu/wustl/jdd/file_01_02.${SUFFIX} < bob_01_02.png >& producer2.log &
sleep 2
nohup ndnputchunks -S id:/producer3 /ndn/edu/wustl/jdd/file_02_01.${SUFFIX} < bob_02_01.png >& producer3.log &
sleep 2
nohup ndnputchunks -S id:/producer4 /ndn/edu/wustl/jdd/file_02_02.${SUFFIX} < bob_02_02.png >& producer4.log &
sleep 2

