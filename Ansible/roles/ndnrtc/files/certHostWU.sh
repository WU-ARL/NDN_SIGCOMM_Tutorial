#!/bin/bash

#create signing id and cert on WU host
ndnsec-key-gen /ndn/edu/wustl/jdd >& cert.request
ndnsec-cert-gen -s /ndn/edu/wustl/jdd -N /ndn/edu/wustl/jdd cert.request  > cert
ndnsec-cert-dump -i /ndn/edu/wustl/jdd > signing.cert



