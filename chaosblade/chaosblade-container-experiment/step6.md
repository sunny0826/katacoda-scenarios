此实验会删除指定容器中的 `redis-server` 进程。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `process` | string | 进程关键词，会在整个命令行中查找 |
| `process-cmd` | string | 进程命令，只会在命令中查找 |
| `count` | string | 限制杀掉进程的数量，0 表示无限制 |
| `signal` | string | 指定杀进程的信号量，默认是 9，例如 --signal 15 |
| `timeout` | string | 设定运行时长，单位是秒，通用参数|

**开始实验**

获取 Pod 名称：

`echo $(kubectl get pod -l app=redis,role=slave -o jsonpath={.items[0]..metadata.name} -n chaosblade)`{{execute}}

获取 container id：

`kubectl get pod $(kubectl get pod -l app=redis,role=slave -o jsonpath={.items[0]..metadata.name} -n chaosblade) -n chaosblade -o custom-columns=CONTAINER:.status.containerStatuses[0].name,ID:.status.containerStatuses[0].containerID`{{execute}}

打开 `kill_container_process_by_id.yaml`{{open}}，将 `container id` 和 `Pod 名称`贴入 `container-ids` 和 `name` 字段。

执行命令，开始实验：

`kubectl apply -f kill_container_process_by_id.yaml`{{execute}}

**查看实验状态**

执行命令： `kubectl get blade kill-container-process-by-id -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

实验后查看容器 id

`kubectl get pod $(kubectl get pod -l app=redis,role=slave -o jsonpath={.items[0]..metadata.name} -n chaosblade) -n chaosblade -o custom-columns=CONTAINER:.status.containerStatuses[0].name,ID:.status.containerStatuses[0].containerID`{{execute}}

容器 id 变化，主进程被杀掉后容器进行了重启，符合实验逾期。

**停止实验**

执行命令：`kubectl delete -f kill_container_process_by_id.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade kill-container-process-by-id`{{execute}}