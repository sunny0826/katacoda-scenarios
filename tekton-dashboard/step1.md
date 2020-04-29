本节将介绍安装 Tekton Dashboard 的方法。

## Katacoda Kubernetes 集群

Katacoda 可能需要一两分钟的时间来初始化你的 Kubernetes 集群。当集群初始化完成后，可以使用`kubectl cluster-info`{{execute}}命令可以查看集群信息。

让我们开始吧！

## 安装 Tekton Dashboard 前提条件

- 安装 [Tekton Pipelines](https://github.com/tektoncd/pipeline/blob/master/docs/install.md)
`kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.10.1/release.yaml`{{execute}}
- 安装 [Tekton Triggers](https://github.com/tektoncd/triggers/blob/master/docs/install.md) (可选)
`kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.3.1/release.yaml`{{execute}}

确认 pods 正常运行：
`kubectl get pods -n tekton-pipelines`{{execute}}

## 安装 Tekton Dashboard

可以参考[安装说明](https://github.com/tektoncd/dashboard#install-dashboard)。执行如下命令，安装 Tekton Dashboard：
`kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/previous/v0.5.3/tekton-dashboard-release.yaml`{{execute}}

<!-- `kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml`{{execute}} -->

确认 Dashboard pods 正常运行：
`kubectl get pods -n tekton-pipelines`{{execute}}

## 暴露 Tekton Dashboard

### 安装 Ingress controller

在 `ingress-nginx` 命名空间安装 nginx ingress controller：
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml`{{execute}}

确认 ingress controller pods 正常运行：
`kubectl get pods -n ingress-nginx`{{execute}}

### 为 Tekton Dashboard 创建 Ingress

查看 Tekton Dashboard Service:
`kubectl get svc tekton-dashboard -n tekton-pipelines`{{execute}}

The Tekton Dashboard Service is exposed on port `9097`. So, create an Ingress
for the `tekton-dashboard` Service on port `9097`:

Tekton Dashboard Service 暴露的端口为`9097`，为`tekton-dashboard` Service 创建一个 Ingress：
```bash
cat << EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: tekton-dashboard
  namespace: tekton-pipelines
spec:
  backend:
    serviceName: tekton-dashboard
    servicePort: 9097
EOF
```{{execute}}

确认 ingress 创建成功：
`kubectl get ingress -n tekton-pipelines`{{execute}}

## 打开 Tekton Dashboard

点击 Katacoda 页面的 `Dashboard` tab ，或者点击如下链接：
https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

设置好 ingress 和 Katacoda，可能需要一分钟的时间。

![Dashboard homepage screenshot](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/dashboard-homepage.png)
