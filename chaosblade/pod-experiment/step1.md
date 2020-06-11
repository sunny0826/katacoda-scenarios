## 检查 Kubernetes 集群

使用前，检查 k8s 集群状态：`kubectl cluster-info`{{execute}}

如果集群未启动，请执行：`launch.sh`{{execute}}

## 实验准备

### 安装 ChaosBlade Operator

ChaosBlade-Operator 需要使用 Helm 安装，进入 [release 页面](https://github.com/chaosblade-io/chaosblade-operator/releases) 下载安装包（ChaosBlade 还提供了阿里云 OSS 的下载地址，提升国内下载速度）。

使用 Helm 3 安装：

**下载安装包**

`wget -qO chaosblade-operator-0.6.0.tgz https://github.com/chaosblade-io/chaosblade/releases/download/v0.6.0/chaosblade-operator-0.6.0-v3.tgz`{{execute}}

为 chaosblade 创建一个 namespace：

`kubectl create namespace chaosblade`{{execute}}

安装 ChaosBlade-Operator：

`helm install chaos chaosblade-operator-0.6.0.tgz --set webhook.enable=true --namespace=chaosblade`{{execute}}

查看安装结果：

`kubectl get pod -n chaosblade | grep chaosblade`{{execute}}

ChaosBlade-Operator 启动后将会在每个节点部署一个 `chaosblade-tool` Pod 和一个 `chaosblade-operator` Pod，如果都运行正常，则安装成功。上面设置 `--set webhook.enable=true` 是为了 Pod 文件系统 I/O 故障实验，如果不需要进行该实验，则无需添加该设置。

### 安装 Guestbook

本实验使用 [guestbook](https://github.com/cloudnativeapp/guestbook?spm=5176.2020520152.0.0.7c5f16ddH8myx6) 应用。

add repo：

`helm repo add apphub-incubator https://apphub.aliyuncs.com/incubator/`{{execute}}

安装

`helm install guestbook apphub-incubator/guestbook --set service.type=NodePort --namespace=chaosblade`{{execute}}

默认的 Service 类型为 `LoadBalancer`，这里为了方便访问设置为了 `NodePort`。
