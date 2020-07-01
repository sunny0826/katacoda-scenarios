查看安装结果：

`kubectl get pod -n chaosblade | grep chaosblade`{{execute}}

### 安装 Guestbook

本实验使用 [guestbook](https://github.com/cloudnativeapp/guestbook?spm=5176.2020520152.0.0.7c5f16ddH8myx6) 应用。

add repo：

`helm repo add apphub-incubator https://apphub.aliyuncs.com/incubator/`{{execute}}

安装

`helm install guestbook apphub-incubator/guestbook --set service.type=NodePort --namespace=chaosblade`{{execute}}

默认的 Service 类型为 `LoadBalancer`，这里为了方便访问设置为了 `NodePort`。

查看安装结果：

`kubectl get pod -n chaosblade`{{execute}}

等待所有 Pod 状态变为 `Running`
