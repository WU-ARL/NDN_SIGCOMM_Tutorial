#!/bin/bash


if [ ! -f test-source-320x240.argb ]
then
  tar -xzf test-source-320x240.argb.tar.gz
fi

sudo ndndump -i eth0 >& ndndump.producer.log &

sleep 2

./ndnrtc-client -c producer.cfg -i clientA -p rule.conf -s /ndn/edu/colostate/jdd -t 120

sleep 2

sudo killall ndndump
