`kubectl apply -f .`{{execute}}

查看 Gateway：

`kubectl get gateway -n istio-system`{{execute}}

可以点击下面的链接访问 kiali：

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/kiali

设置 ingress IP：

`export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')`{{execute}}

`echo $INGRESS_HOST`

设置 Grafana 端口：

`export GRAFANA_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="grafana")].nodePort}')`{{execute}}

`echo $GRAFANA_PORT`

访问 Grafana：

https://[[HOST_SUBDOMAIN]]-[[GRAFANA_PORT]]-[[KATACODA_HOST]].environments.katacoda.com

设置 Prometheus 端口：

`export PROMETHEUS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="prometheus")].nodePort}')`{{execute}}

`echo $PROMETHEUS_PORT`

访问 Prometheus：

https://[[HOST_SUBDOMAIN]]-[[PROMETHEUS_PORT]]-[[KATACODA_HOST]].environments.katacoda.com

设置 Tracing 端口：

`export TRACING_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tracing")].nodePort}')`{{execute}}

`echo $TRACING_PORT`

访问 Tracing：

https://[[HOST_SUBDOMAIN]]-[[TRACING_PORT]]-[[KATACODA_HOST]].environments.katacoda.com