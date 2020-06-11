## Pod 资源自身场景

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

删除 default 命名空间下标签是 `app=httpbin` 的 pod。

**执行观测**

开始观察需要删除的 pod：

```bash
kubectl get pod -l "app=httpbin" -w
```

**开始实验**

新建终端，并开始实验：

```bash
kubectl apply -f delete_pod_by_labels.yaml
```

**查看实验状态**

执行命令：`kubectl get blade delete-two-pod-by-labels -o json`

**停止实验**

执行命令：`kubectl delete -f delete_pod_by_labels.yaml`

或者直接删除 blade 资源：`kubectl delete blade delete-two-pod-by-labels`
