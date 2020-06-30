#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -

cd istio-*

export PATH=$PATH:$(pwd)/bin

istioctl manifest apply --set profile=demo

cd ..