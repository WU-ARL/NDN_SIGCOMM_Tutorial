#!/bin/bash

# make sure any old nfd is stopped:
nfd-stop
sleep 5

# start a new nfd:
nfd-start >& nfd-start.log
sleep 5

# use Arizona as gateway router:
nfdc register / udp://hobo.cs.arizona.edu

# configure for prefix registration at Arizona:
nfdc register /localhop/nfd udp4://hobo.cs.arizona.edu

sleep 5

# test connection to Arizona gateway with ndnping
ndnping -c 5 /ndn/edu/arizona

# set identity to Arizona based name:
ndnsec-set-default /ndn/edu/arizona/jdd

