#!/bin/bash

PRODUCER=`cat producer_hostname`

nfdc face destroy udp4://${PRODUCER}


