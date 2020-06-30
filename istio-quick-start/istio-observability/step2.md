`kubectl apply -f .`{{execute}}

查看 Gateway：

`kubectl get gateway -n istio-system`{{execute}}

可以点击下面的链接访问 kiali：

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/kiali

查看 Grafana 端口：

`echo $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="grafana")].nodePort}')`{{execute}}

查看 Prometheus 端口：

`echo $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="prometheus")].nodePort}')`{{execute}}

查看 Tracing 端口：

`echo $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tracing")].nodePort}')`{{execute}}

点击进入页面：

https://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com

将查询到的端口输入并点击 `Display Port` 即可访问对应服务：

![image](https://tvax3.sinaimg.cn/large/ad5fbf65ly1ge1i1rjevnj21hc0q8jst.jpg)