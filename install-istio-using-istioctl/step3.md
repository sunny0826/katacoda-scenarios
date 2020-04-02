
### 安装 demo 示例

使用 `demo` 配置安装 istio：

`istioctl manifest apply --set profile=demo`{{execute}}

检查 Kubernetes 服务是否部署正常,检查除 `jaeger-agent` 服务外的其他服务，是否均有正确的 `CLUSTER-IP`：

`kubectl get svc -n istio-system`{{execute}}

检查相关 pod 是否部署成功，并且 `STATUS` 为 `Running`：

`kubectl get pods -n istio-system`{{execute}}

如果都正常部署，就可以部署自己的服务了。

### 后续步骤

部署成功后，如果您不知道从哪开始，可以移步 Bookinfo 示例，体检 Istio 的流量路由、故障注入、速率限制等功能，相关内容会在 Bookinfo 部分介绍，这里不做展开。

### 卸载 istio

卸载程序将删除 `RBAC` 权限、`istio-system` 命名空间和所有相关资源。可以忽略那些不存在的资源的报错，因为它们可能已经被删除掉了。

`istioctl manifest generate --set profile=demo | kubectl delete -f -`{{execute}}
