此实验会删除 `node01` 节点上的 `redis-server` 进程。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `process` | string | 进程关键词，会在整个命令行中查找 |
| `process-cmd` | string | 进程命令，只会在命令中查找 |
| `count` | string | 限制杀掉进程的数量，0 表示无限制 |
| `signal` | string | 指定杀进程的信号量，默认是 9，例如 --signal 15 |
| `timeout` | string | 设定运行时长，单位是秒，通用参数|

**开始实验**

这里选择 `node01` 节点，可以打开 `kill_node_process_by_names.yaml`{{open}} 查看配置。

进入终端2：
`echo "Run in Terminal 2"`{{execute T2}}

查看 `redis-server` 的进程号 `ps -ef | grep redis-server`{{execute}}

回到控制节点：
`echo "Run in Terminal 1"`{{execute T1}}

开始实验：
`kubectl apply -f kill_node_process_by_names.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade kill-node-process-by-names -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

进入终端2：
`echo "Run in Terminal 2"`{{execute T2}}

再次查看 `redis-server` 的进程号 `ps -ef | grep redis-server`{{execute}}

`redis-server` 的进程号发生改变，说明被杀掉后，又被重新拉起。

回到控制节点：
`echo "Run in Terminal 1"`{{execute T1}}

**停止实验**

执行命令：`kubectl delete -f kill_node_process_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade kill-node-process-by-names`{{execute}}
