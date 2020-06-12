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

获取 Pod 名称：

`echo $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade)`{{execute}}

打开 `delay_pod_network_by_names.yaml`{{open}} 将 `Pod 名称`贴入 `name` 字段

执行命令，开始实验：

`kubectl apply -f delay_pod_network_by_names.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade delay-pod-network-by-names -n chaosblade -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

获取实验 pod ip：
`echo $(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items..status.podIP})`{{execute}}

直接从观测 pod 访问实验 pod IP
`kubectl exec $(kubectl get pod -l app=redis,role=slave -n chaosblade -o jsonpath={.items[0]..metadata.name}) -n chaosblade -- bash -c 'apt-get update && apt-get install -y telnet && time echo "" | telnet '$(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items..status.podIP})' 6379'`{{execute}}

可以看到结果符合预期

**停止实验**

执行命令：`kubectl delete -f delay_pod_network_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade delay-pod-network-by-names`{{execute}}
