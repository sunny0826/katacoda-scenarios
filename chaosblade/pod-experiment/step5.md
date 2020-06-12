**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `domain` | string | 域名 (必要参数) |
| `ip` | string | 映射的 ip (必要参数) |
| `timeout` | string | 设定运行时长，单位是秒，通用参数。 |

**开始实验**

获取 Pod 名称：

`echo $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade)`{{execute}}

打开 `dns_pod_network_by_names.yaml`{{open}} ，将`Pod 名称`贴入 `name` 字段

执行命令，开始实验：

`kubectl apply -f dns_pod_network_by_names.yaml`{{execute}}

**查看实验状态**

执行命令： `kubectl get blade dns-pod-network-by-names -o json `{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

直接从实验 pod PING www.baiud.com：
`kubectl exec $(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items..metadata.name}) -n chaosblade -- bash -c 'ping www.baidu.com'`{{execute}}

无响应，`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

查看 `/etc/hosts`:
`kubectl exec $(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items..metadata.name}) -n chaosblade -- bash -c 'cat /etc/hosts'`{{execute}}

可以看到 Pod 的 `/etc/hosts` 文件被修改，模拟了 dns 解析异常的场景。

**停止实验**

执行命令：`kubectl delete -f dns_pod_network_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade dns-pod-network-by-names`{{execute}}
