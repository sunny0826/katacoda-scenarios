curl -L https://raw.githubusercontent.com/istio/istio/release-1.5/release/downloadIstioCandidate.sh | sh -
export PATH=$PATH:/root/istio-1.5.1/bin
istioctl manifest apply --set profile=demo