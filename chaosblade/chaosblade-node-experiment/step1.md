请等待 ChaosBlade Operator 和 Guestbook 安装完成。

查看安装结果：

`kubectl get pod -n chaosblade`{{execute}}

等待所有 Pod 状态变为 `Running`

**参数**

node 资源均支持以下参数。

| 参数 | 类型 | 说明 | 默认值 |
| --- | --- | --- | --- |
| `evict-count` | string | 限制实验生效的数量 | |
| `evict-percent` | string | 限制实验生效数量的百分比，不包含 % | |
| `labels` | string | Pod 资源标签，多个标签之间是或的关系 | |
| `names` | string | Pod 资源名 | |
| `waiting-time` | string | 实验结果等待时间，参数值要包含单位，例如 10s，1m | 20s |
