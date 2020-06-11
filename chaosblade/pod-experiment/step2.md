**参数**

Pod 资源均支持以下参数。

| 参数 | 类型 | 说明 | 默认值 |
| --- | --- | --- | --- |
| `namespace` | string | Pod 所属的命名空间 | default |
| `evict-count` | string | 限制实验生效的数量 | |
| `evict-percent` | string | 限制实验生效数量的百分比，不包含 % | |
| `labels` | string | Pod 资源标签，多个标签之前是或的关系 | |
| `names` | string | Pod 资源名 | |
| `waiting-time` | string | 实验结果等待时间，参数值要包含单位，例如 10s，1m | 20s |

### 删除 Pod

删除 chaosblade 命名空间下标签是 `role=master` 的 pod。

**执行观测**

开始观察需要删除的 pod：

`kubectl get pod -l "role=master" -n chaosblade -w`{{execute}}

**开始实验**

打开新终端：
`echo "Run in Terminal 2"`{{execute T2}}

在新终端开始实验：
`kubectl apply -f delete_pod_by_labels.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade delete-two-pod-by-labels -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**查看实验结果**

回到终端1，查看实验结果：

`echo "Run in Terminal 1"`{{execute T1}}

可以看到 pod 名称发生变化，表示原 pod 已被删除。

结束 pod 观测：
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

**停止实验**

执行命令：`kubectl delete -f delete_pod_by_labels.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade delete-two-pod-by-labels`{{execute}}
