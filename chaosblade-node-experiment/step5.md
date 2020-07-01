本实验通过修改 Node 的 hosts，篡改域名地址映射，模拟 Pod 内域名访问异常场景。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `domain` | string | 域名 (必要参数) |
| `ip` | string | 映射的 ip (必要参数) |
| `timeout` | string | 设定运行时长，单位是秒，通用参数。 |

**开始实验**

这里选择 `controlplane` 节点，可以打开 `dns_node_network_by_names.yaml`{{open}} 查看配置。

开始实验：
`kubectl apply -f dns_node_network_by_names.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade dns-node-network-by-names -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

进入终端2：
`echo "Run in Terminal 2"`{{execute T2}}

ping 百度无响应

`ping www.baidu.com`{{execute}}

结束观测：
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

可以看到 Node 的 `/etc/hosts` 文件被修改，模拟了 dns 解析异常的场景。

`cat /etc/hosts`{{execute}}

回到控制节点：
`echo "Run in Terminal 1"`{{execute T1}}

**停止实验**

执行命令：`kubectl delete -f dns_node_network_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade dns-node-network-by-names`{{execute}}
