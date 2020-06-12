>注意：此场景需要激活 `--webhook-enable` 参数，如需使用此功能，请在 chaosblade-operator 参数中添加 `--webhook-enable`，或者在安装时指定：例如 helm 安装时添加 `--set webhook.enable=true` 指定。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `methods` | string | I/O故障方法。 |
| `delay` | string | I/O延迟时间。 |
| `errno` | string | 指定特性的I/O异常错误码。 |
| `random` | string | 随机产生I/O异常错误码。 |
| `percent` | string | I/O错误百分比 [0-100]。 |
| `path` | string | I/O异常的目录或者文件。 |

**前提条件**

- 集群中部署了 `chaosblade-admission-webhook`
- 需要注入故障的 `volume` 设置 `mountPropagation` 为 `HostToContainer`
- pod 上面添加了如下 `annotations`:
<pre>
    <code class="yaml">
    chaosblade/inject-volume: "data" //需要注入故障的 volume name
    chaosblade/inject-volume-subpath: "conf" //volume 挂载的子目录
    </code>
</pre>

**部署测试 pod**

chaosblade webhook 会根据 pod 的 annotation，注入 fuse 的 sidecar 容器：

1. `chaosblade/inject-volume` 指明需要注入故障的 volume name，比如例子中的 `data`。
2. `chaosblade/inject-volume-subpath` 指明 volume 挂载路径的子目录。上面的例子中，volume 的挂载路径是 `/data`,子目录是 `conf`，则在 pod 内，注入I/O异常的目录是 `/data/conf`。
3. 指定需要注入故障的 volume 需要指定 `mountPropagation：HostToContainer`，这个字段的含义可以参考官方文档 [Volumes](https://kubernetes.io/docs/concepts/storage/volumes/#mount-propagation)。

执行命令，开始实验：

`kubectl apply -f io-test-pod.yaml`{{execute}}

查看 sidecar 是否注入成功：

`kubectl get pod $(kubectl get pod -l app=test -o jsonpath={.items..metadata.name} -n chaosblade) -n chaosblade`{{execute}}

**开始实验**

可以打开 `pod_io.yaml`{{open}} 查看故障配置

执行命令，开始实验：
`kubectl apply -f pod_io.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade inject-pod-by-labels -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

首先需要在 pod 目录新建一个文件进行模拟：
`kubectl exec $(kubectl get pod -l app=test -n chaosblade -o jsonpath={.items..metadata.name}) -c test -n chaosblade -- /bin/sh -c 'echo test > /data/conf/test.yaml'`{{execute}}

读取指定新建的实验文件，查看访问时间：
`kubectl exec $(kubectl get pod -l app=test -n chaosblade -o jsonpath={.items..metadata.name}) -c test -n chaosblade -- /bin/sh -c 'time cat /data/conf/test.yaml'`{{execute}}

由于这里设置了 60% 的异常率，需要多访问几次来进行观测。

在本例中，我们对 read 操作注入两种异常，异常率为百分之 60:

- 对 `read` 操作增加 1s 的延迟。
- 对 `read` 操作返回错误 `28`。

这里只是做了一种类型的实验，更多的实验类型详见[官方文档](https://chaosblade-io.gitbook.io/chaosblade-help-zh-cn/blade-create-k8s/blade-create-k8s-pod-io)。

**停止实验**

执行命令：`kubectl delete -f pod_io.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade inject-pod-by-labels`{{execute}}

删除测试 pod：`kubectl delete -f io-test-pod.yaml`{{execute}}

#### 附录

**支持的I/O故障方法**

`open`
`read`
`write`
`mkdir`
`rmdir`
`opendir`
`fsync`
`flush`
`release`
`truncate`
`getattr`
`chown`
`chmod`
`utimens`
`allocate`
`getlk`
`setlk`
`setlkw`
`statfs`
`readlink`
`symlink`
`create`
`access`
`link`
`mknod`
`rename`
`unlink`
`getxattr`
`listxattr`
`removexattr`
`setxattr`

**I/O异常错误码**


| 错误码 | 错误信息|
| --- | --- |
| `1` | `Operation not permitted` |
| `2` | `No such file or directory` |
| `5` | `I/O error` |
| `6` | `No such device or address` |
| `12` | `Out of memory` |
| `16` | `Device or resource busy` |
| `17` | `File exists` |
| `20` | `Not a directory` |
| `22` | `Invalid argument` |
| `24` | `Too many open files` |
| `28` | `No space left on device` |
