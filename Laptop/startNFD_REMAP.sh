#!/bin/bash

nfd-stop
sleep 5

nfd-start >& /dev/null
sleep 5

# use REMAP as gateway router:
nfdc register / udp://128.97.98.7

# configure for prefix registration at REMAP:
nfdc register /localhop/nfd udp4://128.97.98.7

sleep 5

ndnping -c 5 /ndn/edu/ucla/remap
ndnsec-set-default    /ndn/edu/ucla/remap/%40GUEST/jdd%40wustl.edu
