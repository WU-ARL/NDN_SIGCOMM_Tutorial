#!/bin/bash


if [ ! -f test-source-320x240.argb ]
then
  tar -xzf test-source-320x240.argb.tar.gz
fi

./ndnrtc-client -c producer.cfg -i clientA -p rule.conf -s /ndn/edu/wustl/jdd -t 120
