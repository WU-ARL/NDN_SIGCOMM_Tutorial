#!/bin/bash

# make sure any old nfd is stopped:
nfd-stop
sleep 5

# start a new nfd:
nfd-start >& nfd-start.log
sleep 5

# use WU as gateway router:
nfdc register / udp://wundngw.arl.wustl.edu

# configure for prefix registration at WU:
nfdc register /localhop/nfd udp4://wundngw.arl.wustl.edu

sleep 5

# test connection to WU gateway with ndnping
ndnping -c 5 /ndn/edu/wustl

# set identity to WU based name:
ndnsec-set-default /ndn/edu/wustl/jdd

