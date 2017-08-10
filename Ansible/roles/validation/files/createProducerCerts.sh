#!/bin/bash

cd /home/ubuntu/validation

ndnsec-key-gen /producer1 > producer1.request
ndnsec-cert-gen -N producer1 -s /producer1 producer1.request > producer1.cert.base64
ndnsec-cert-dump -i /producer1 > producer1.cert

ndnsec-key-gen /producer2 > producer2.request
ndnsec-cert-gen -N producer2 -s /producer2 producer2.request > producer2.cert.base64
ndnsec-cert-dump -i /producer2 > producer2.cert

ndnsec-key-gen /producer3 > producer3.request
ndnsec-cert-gen -N producer3 -s /producer3 producer3.request > producer3.cert.base64
ndnsec-cert-dump -i /producer3 > producer3.cert

ndnsec-key-gen /producer4 > producer4.request
ndnsec-cert-gen -N producer4 -s /producer4 producer4.request > producer4.cert.base64
ndnsec-cert-dump -i /producer4 > producer4.cert


