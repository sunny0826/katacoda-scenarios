#### 检查 k8s 集群

使用前，检查 k8s 集群状态：`kubectl cluster-info`{{execute}}

如果集群未启动，请执行：`launch.sh`{{execute}}

检查 `katacoda-cloud-provider`，这个会影响到环境是否能正常提供外部负载均衡:

`kubectl get deploy -n kube-system katacoda-cloud-provider`{{execute}}

**注意**：这里要观察 `istio-ingressgateway` 的 `EXTERNAL-IP`，如果为 `<pending>`，则环境暂时不能正常提供外部负载均衡，无法使用 ingress gateway。 在这种情况下，可以等待一段时间，如果一段时间后还是 `<pending>` 状态，建议刷新页面，重新开启课程安装 istio：

`kubectl get svc -n istio-system`{{execute}}

检查相关 pod 是否部署成功，并且 `STATUS` 为 `Running`：

`kubectl get pods -n istio-system`{{execute}}