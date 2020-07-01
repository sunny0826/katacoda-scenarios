`node01` 节点的 `guestbook` 的端口注入丢包率 100% 的故障。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `destination-ip` | string | 目标 IP. 支持通过子网掩码来指定一个网段的IP地址, 例如 192.168.1.0/24. 则 192.168.1.0~192.168.1.255 都生效。你也可以指定固定的 IP，如 192.168.1.1 或者 192.168.1.1/32，也可以通过都号分隔多个参数，例如 192.168.1.1,192.168.2.1。 |
| `exclude-port` | string | 排除掉的端口，默认会忽略掉通信的对端端口，目的是保留通信可用。可以指定多个，使用逗号分隔或者连接符表示范围，例如 22,8000 或者 8000-8010。 这个参数不能与 --local-port 或者 --remote-port 参数一起使用。 |
| `exclude-ip` | string | 排除受影响的 IP，支持通过子网掩码来指定一个网段的IP地址, 例如 192.168.1.0/24. 则 192.168.1.0~192.168.1.255 都生效。你也可以指定固定的 IP，如 192.168.1.1 或者 192.168.1.1/32，也可以通过都号分隔多个参数，例如 192.168.1.1,192.168.2.1。 |
| `interface` | string | 网卡设备，例如 eth0 (必要参数)。 |
| `local-port` | string | 本地端口，一般是本机暴露服务的端口。可以指定多个，使用逗号分隔或者连接符表示范围，例如 80,8000-8080。 |
| `percent` | string | 丢包百分比，取值在[0, 100]的正整数 (必要参数)。 |
| `remote-port` | string | 远程端口，一般是要访问的外部暴露服务的端口。可以指定多个，使用逗号分隔或者连接符表示范围，例如 80,8000-8080。 |
| `force` |  | 强制覆盖已有的 tc 规则，请务必在明确之前的规则可覆盖的情况下使用。 |
| `ignore-peer-port` |  | 针对添加 --exclude-port 参数，报 ss 命令找不到的情况下使用，忽略排除端口。 |
| `timeout` | string | 设定运行时长，单位是秒，通用参数。 |

**开始实验**

获取 NodePort 端口：`echo $(kubectl get svc -n chaosblade guestbook -o jsonpath={.spec.ports[0].nodePort})`{{execute}}

可以打开 `loss_node_network_by_names.yaml`{{open}}，将 NodePort 端口贴入 `local-port` 字段。

开始实验：
`kubectl apply -f loss_node_network_by_names.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade loss-node-network-by-names -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

该端口为 `Guestbook` nodeport 的端口，访问实验端口无响应，但是访问未开启实验的端口可以正常使用

访问实验节点的 Guestbook - 无法访问：

`telnet $(kubectl get nodes node01 -o jsonpath={.status.addresses[0].address}) $(kubectl get svc -n chaosblade guestbook -o jsonpath={.spec.ports[0].nodePort})`{{execute}}

结束观测：
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

访问非实验节点 Guestbook - 正常访问：

`telnet $(kubectl get nodes $(kubectl get node --selector='node-role.kubernetes.io/master' -o jsonpath={.items..metadata.name}) -o jsonpath={.status.addresses[0].address}) $(kubectl get svc -n chaosblade guestbook -o jsonpath={.spec.ports[0].nodePort})`{{execute}}

结束观测：
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

**停止实验**

执行命令：`kubectl delete -f loss_node_network_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade loss-node-network-by-names`{{execute}}
