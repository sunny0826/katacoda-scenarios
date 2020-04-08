#!/bin/bash

sudo grep -i "done" curl -L https://raw.githubusercontent.com/istio/istio/release-1.5/release/downloadIstioCandidate.sh | sh - &> /dev/null
if [[ "$?" -eq 0 ]]; then
exit
fi

export PATH=$PATH:/root/istio-1.5.1/bin

istioctl manifest apply --set profile=demo