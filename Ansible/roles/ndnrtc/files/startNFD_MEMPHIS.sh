#!/bin/bash

# make sure any old nfd is stopped:
nfd-stop
sleep 5

# start a new nfd:
nfd-start >& nfd-start.log
sleep 5

# use Memphis as gateway router:
nfdc register / udp://titan.cs.memphis.edu

# configure for prefix registration at Memphis:
nfdc register /localhop/nfd udp4://titan.cs.memphis.edu

sleep 5

# test connection to Memphis gateway with ndnping
ndnping -c 5 /ndn/edu/memphis

# set identity to Memphis based name:
ndnsec-set-default /ndn/edu/memphis/jdd

