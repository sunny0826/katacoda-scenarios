此实验会挂起 `node01` 节点上的 `redis-server` 进程。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `process` | string | 进程关键词，会在整个命令行中查找 |
| `process-cmd` | string | 进程命令，只会在命令中查找 |
| `timeout` | string | 设定运行时长，单位是秒，通用参数|

**开始实验**

这里选择 `node01` 节点，可以打开 `stop_node_process_by_names.yaml`{{open}} 查看配置。

开始实验：
`kubectl apply -f stop_node_process_by_names.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade stop-node-process-by-names -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

进入终端2：
`echo "Run in Terminal 2"`{{execute T2}}

可以看到 `redis-server` 此刻进程处于暂停状态了（T）。

`ps aux| grep redis-server`{{execute}}

回到控制节点：
`echo "Run in Terminal 1"`{{execute T1}}

**停止实验**

执行命令：`kubectl delete -f stop_node_process_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade stop-node-process-by-names`{{execute}}
