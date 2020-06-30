#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -

export PATH=$PATH:/root/istio-*/bin

istioctl manifest apply --set profile=demo