#!/bin/bash

PRODUCER=`cat producer_hostname`

#nfdc route add /ndn/edu/wustl/jdd udp4://${PRODUCER}
nfdc register -o 65 /ndn/edu/wustl/jdd udp4://${PRODUCER}


