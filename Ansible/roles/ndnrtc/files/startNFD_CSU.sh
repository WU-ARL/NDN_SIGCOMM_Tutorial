#!/bin/bash

# make sure any old nfd is stopped:
nfd-stop
sleep 5

# start a new nfd:
nfd-start >& nfd-start.log
sleep 5

# use CSU as gateway router:
nfdc register / udp://ndn.netsec.colostate.edu

# configure for prefix registration at CSU:
nfdc register /localhop/nfd udp4://ndn.netsec.colostate.edu

sleep 5

# test connection to CSU gateway with ndnping
ndnping -c 5 /ndn/edu/colostate

# set identity to CSU based name:
ndnsec-set-default /ndn/edu/colostate/jdd

