#!/bin/bash

#create signing id and cert on WU host
ndnsec-key-gen /ndn/edu/memphis/jdd >& cert.request
ndnsec-cert-gen -s /ndn/edu/memphis/jdd -N /ndn/edu/memphis/jdd cert.request  > cert
ndnsec-cert-dump -i /ndn/edu/memphis/jdd > signing.cert



