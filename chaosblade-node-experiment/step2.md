`node01` 节点，做 CPU 负载 60% 实验。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `timeout` | string | 设定运行时长，单位是秒，通用参数 |
| `cpu-count` | string | 指定 CPU 满载的个数 |
| `cpu-list` | string | 指定 CPU 满载的具体核，核索引从 0 开始 (0-3 or 1,3) |
| `cpu-percent` | string | 指定 CPU 负载百分比，取值在 0-100 |

**开始实验**

这里选择 `node01` 节点，可以打开 `node_cpu_load.yaml`{{open}} 查看配置。

开始实验：
`kubectl apply -f node_cpu_load.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade cpu-load -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**查看实验结果**

打开新终端：
`echo "Run in Terminal 2"`{{execute T2}}

进入 node01 节点，按照要求输入 `yes`

`ssh root@$(kubectl get nodes node01 -o jsonpath={.status.addresses[0].address})`

使用 `top`{{execute}} 命令，查看 `controlplane` 节点（终端所在节点）CPU。

结束 pod 观测：
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

回到控制节点：
`echo "Run in Terminal 1"`{{execute T1}}

**停止实验**

执行命令：`kubectl delete -f node_cpu_load.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade cpu-load`{{execute}}
