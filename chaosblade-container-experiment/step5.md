本实验通过修改本地的 hosts，篡改域名地址映射，模拟 container 内域名访问异常场景。

**实验参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `domain` | string | 域名 (必要参数) |
| `ip` | string | 映射的 ip (必要参数) |
| `timeout` | string | 设定运行时长，单位是秒，通用参数。 |

**开始实验**

获取 Pod 名称：

`echo $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade)`{{execute}}

获取 container id：

`kubectl get pod $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade) -n chaosblade -o custom-columns=CONTAINER:.status.containerStatuses[0].name,ID:.status.containerStatuses[0].containerID`{{execute}}

打开 `tamper_container_dns_by_id.yaml`{{open}} ，将 `container id` 和 `Pod 名称`贴入 `container-ids` 和 `name` 字段

执行命令，开始实验：

`kubectl apply -f tamper_container_dns_by_id.yaml`{{execute}}

**查看实验状态**

执行命令： `kubectl get blade tamper-container-dns-by-id -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

直接从实验 pod 访问 `wwww.baidu.com`：
`kubectl exec $(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items[0]..metadata.name}) -n chaosblade -- bash -c 'ping www.baidu.com'`{{execute}}

无响应，`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

查看容器 `/etc/hosts` 文件：
`kubectl exec $(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items[0]..metadata.name}) -n chaosblade -- bash -c 'cat /etc/hosts'`{{execute}}

可以看到 Node 的 `/etc/hosts` 文件被修改，模拟了 dns 解析异常的场景。

**停止实验**

执行命令：`kubectl delete -f tamper_container_dns_by_id.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade tamper-container-dns-by-id `{{execute}}