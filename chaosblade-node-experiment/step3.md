> 实验前，请先登录 node 节点，使用 `ifconfig` 命令查看网卡信息，不是所有系统默认的网卡名称都是 `eth0`。

`controlplane` 节点的本地 `guestbook` 的端口添加 3000 毫秒访问延迟，延迟时间上下浮动 1000 毫秒。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `destination-ip` | string | 目标 IP. 支持通过子网掩码来指定一个网段的IP地址, 例如 192.168.1.0/24. 则 192.168.1.0~192.168.1.255 都生效。你也可以指定固定的 IP，如 192.168.1.1 或者 192.168.1.1/32，也可以通过都号分隔多个参数，例如 192.168.1.1,192.168.2.1。 |
| `exclude-port` | string | 排除掉的端口，默认会忽略掉通信的对端端口，目的是保留通信可用。可以指定多个，使用逗号分隔或者连接符表示范围，例如 22,8000 或者 8000-8010。 这个参数不能与 --local-port 或者 --remote-port 参数一起使用。 |
| `exclude-ip` | string | 排除受影响的 IP，支持通过子网掩码来指定一个网段的IP地址, 例如 192.168.1.0/24. 则 192.168.1.0~192.168.1.255 都生效。你也可以指定固定的 IP，如 192.168.1.1 或者 192.168.1.1/32，也可以通过都号分隔多个参数，例如 192.168.1.1,192.168.2.1。 |
| `interface` | string | 网卡设备，例如 eth0 (必要参数)。 |
| `local-port` | string | 本地端口，一般是本机暴露服务的端口。可以指定多个，使用逗号分隔或者连接符表示范围，例如 80,8000-8080。 |
| `offset` | string | 延迟时间上下浮动的值, 单位是毫秒。 |
| `remote-port` | string | 远程端口，一般是要访问的外部暴露服务的端口。可以指定多个，使用逗号分隔或者连接符表示范围，例如 80,8000-8080。 |
| `time` | string | 延迟时间，单位是毫秒 (必要参数)。 |
| `force` |  | 强制覆盖已有的 tc 规则，请务必在明确之前的规则可覆盖的情况下使用。 |
| `ignore-peer-port` |  | 针对添加 --exclude-port 参数，报 ss 命令找不到的情况下使用，忽略排除端口。 |
| `timeout` | string | 设定运行时长，单位是秒，通用参数。 |

**开始实验**

获取 NodePort 端口：`echo $(kubectl get svc -n chaosblade guestbook -o jsonpath={.spec.ports[0].nodePort})`{{execute}}

可以打开 `delay_node_network_by_names.yaml`{{open}}，将 NodePort 端口贴入 `local-port` 字段。

开始实验：
`kubectl apply -f delay_node_network_by_names.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade delay-node-network-by-names -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**查看实验结果**

访问实验节点端口，查看延迟：

`time echo "" | telnet $(kubectl get nodes controlplane -o jsonpath={.status.addresses[0].address}) $(kubectl get svc -n chaosblade guestbook -o jsonpath={.spec.ports[0].nodePort})`{{execute}}

访问未开启实验节点端口，无延迟：

`time echo "" | telnet $(kubectl get nodes node01 -o jsonpath={.status.addresses[0].address}) $(kubectl get svc -n chaosblade guestbook -o jsonpath={.spec.ports[0].nodePort})`{{execute}}

**停止实验**

执行命令：`kubectl delete -f delay_node_network_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade delay-node-network-by-names`{{execute}}
