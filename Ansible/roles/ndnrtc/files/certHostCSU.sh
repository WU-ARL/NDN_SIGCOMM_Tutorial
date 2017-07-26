#!/bin/bash

#create signing id and cert on WU host
ndnsec-key-gen /ndn/edu/colostate/jdd >& cert.request
ndnsec-cert-gen -s /ndn/edu/colostate/jdd -N /ndn/edu/colostate/jdd cert.request  > cert
ndnsec-cert-dump -i /ndn/edu/colostate/jdd > signing.cert



