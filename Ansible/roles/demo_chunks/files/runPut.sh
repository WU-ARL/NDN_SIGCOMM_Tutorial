#!/bin/bash

SUFFIX="000"
if [ $# -eq 1 ]
then
  SUFFIX=$1
fi

if [ ! -f testfile.5MB ]
then
  dd if=/dev/zero of=testfile.5MB bs=1024 count=5120
fi

# make sure there is not already one running
killall ndnputchunks

echo "nohup ndnputchunks  -s 1000 ndn:/ndn/edu/wustl/jdd/testfile.5MB.${SUFFIX} < testfile.5MB & " > runPut.sh.echo

nohup ndnputchunks  -s 1000 ndn:/ndn/edu/wustl/jdd/testfile.5MB.${SUFFIX} < testfile.5MB &

sleep 2

ps auxwww | grep chunks >& ps.out

