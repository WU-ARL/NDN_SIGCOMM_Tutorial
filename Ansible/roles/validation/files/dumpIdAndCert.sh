#!/bin/bash

NDN_ID=`ndnsec-ls-identity | awk '{print $2}'`
echo "$NDN_ID" > ndn.id

ndnsec-cert-dump -i $NDN_ID > ndn.cert


