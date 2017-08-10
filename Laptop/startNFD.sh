#!/bin/bash

nfd-stop
sleep 5

nfd-start >& /dev/null
sleep 5

# use UCLA as gateway router:
nfdc register / udp://spurs.cs.ucla.edu

# configure for prefix registration at UCLA:
nfdc register /localhop/nfd udp4://spurs.cs.ucla.edu

sleep 5

ndnping -c 5 /ndn/edu/ucla
ndnsec-set-default    /ndn/edu/ucla/%40GUEST/jdd%40wustl.edu
