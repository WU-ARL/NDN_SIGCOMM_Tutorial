#!/bin/bash

sudo ndndump -i eth0 >& ndndump.consumer.log &

sleep 2

./ndnrtc-client -c csu_consumer_of_csu.cfg -p rule.conf -s /ndn/edu/colostate/jdd -t 30

sleep 2

sudo killall ndndump

