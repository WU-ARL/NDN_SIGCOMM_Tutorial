#!/bin/bash

#create signing id and cert on WU host
ndnsec-key-gen /ndn/edu/arizona/jdd >& cert.request
ndnsec-cert-gen -s /ndn/edu/arizona/jdd -N /ndn/edu/arizona/jdd cert.request  > cert
ndnsec-cert-dump -i /ndn/edu/arizona/jdd > signing.cert



